import os

from google.appengine.ext.webapp import RequestHandler, WSGIApplication, template
from google.appengine.ext.webapp.util import run_wsgi_app

class MainPage(RequestHandler):
    def get(self):
        self.response.headers['Content-Type'] = 'text/plain'
        self.response.out.write('Hello, webapp World!')

urls = [
  ('/', MainPage),
]

application = WSGIApplication(urls, debug=True)

def main():
    run_wsgi_app(application)

if __name__ == "__main__":
    main()
