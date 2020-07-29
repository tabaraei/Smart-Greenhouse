from .views import *
from rest_framework.routers import DefaultRouter


router = DefaultRouter()
router.register('environments', EnvironmentViewSet, basename='environment')
router.register('toggles', ToggleViewSet, basename='toggle')
router.register('thresholds', ThresholdViewSet, basename='threshold')

urlpatterns = [

] + router.urls
