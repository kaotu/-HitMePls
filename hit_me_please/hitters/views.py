from django.http import HttpResponse
from django.views import View

class LandingPageView(View):
    def get(self, request):
        html = '<form action="." method="post"><input type="email" name="email"><button type="submit">Submit</button>'
        return HttpResponse(html);
