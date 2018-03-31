from django.core.management.base import BaseCommand
from main.models import Process


class Command(BaseCommand):

    def add_arguments(self, parser):
        parser.add_argument('pid', nargs=1)

    def handle(self, *args, **options):
        pid = options['pid'][0]
        p = Process.objects.get(pid=pid)
        p.done = True
        p.save()
