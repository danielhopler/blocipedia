class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    !@record.private? || (@user && @record.private? && (@record.user_id == @user.id || @user.admin?) )
  end

  def create?
    :user_signed_in?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.present?
  end

  def destroy?
    user.admin? || (record.user == user)
  end


  class Scope
      attr_reader :user, :scope

      def wiki
        record
      end

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        wikis = []
        if user.admin?
          wikis = scope.all # if the user is an admin, show them all the wikis
        elsif user.premium?
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if !wiki.private? || wiki.user == user || wiki.collaborators.include?(user)
              wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
            end
          end
        else # this is the lowly standard user
          all_wikis = scope.all
          wikis = []
          all_wikis.each do |wiki|
            if !wiki.private? || wiki.collaborators.include?(user)
              wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
            end
          end
        end
        wikis # return the wikis array we've built up
      end
    end
end
