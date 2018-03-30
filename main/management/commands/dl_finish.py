from django.core.management.base import BaseCommand
from viewer.models import DLTrain


class Command(BaseCommand):

    def add_arguments(self, parser):
        parser.add_argument('pid', nargs=1)

    def handle(self, *args, **options):
        pid = options['pid'][0]
        p = DLTrain.objects.get(pid=pid)
        p.done = True
        p.save()
