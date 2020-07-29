from .serializers import EnvironmentSerializer, ToggleSerializer, ThresholdSerializer
from .models import Environment, Toggle, Threshold
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin, ListModelMixin, UpdateModelMixin
from rest_framework.decorators import action


class EnvironmentViewSet(
    GenericViewSet,
    CreateModelMixin,
    RetrieveModelMixin,
    ListModelMixin
):
    queryset = Environment.objects.all()
    serializer_class = EnvironmentSerializer

    @action(detail=False, methods=['post'])
    def list_last_n(self, request):
        queryset = Environment.objects.all().order_by(
            '-id')[:int(request.data['number'])]
        return Response(
            {
                'result': EnvironmentSerializer(queryset, many=True).data
            }
        )


class ToggleViewSet(
    GenericViewSet,
    CreateModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin
):
    queryset = Toggle.objects.all()
    serializer_class = ToggleSerializer


class ThresholdViewSet(
    GenericViewSet,
    CreateModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin
):
    queryset = Threshold.objects.all()
    serializer_class = ThresholdSerializer
