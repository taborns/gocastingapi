from rest_framework import permissions
from gocasting import models, constants 

class IsAgent(permissions.BasePermission):
    """
    Global permission check for agents .
    """

    def has_permission(self, request, view):
        is_agent = request.user.is_authenticated and hasattr( request.user, 'agent')
        return is_agent
