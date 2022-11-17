from application import app

def test_home_page():
    response = app.test_client().get('/')
    assert response.status_code == 200
    
def test_URL_Page():
    response = app.test_client().get('/your-url')
    assert response.status_code == 302
    
def test_error_page():
    response = app.test_client().get('/page_not_found')
    assert response.status_code == 404

def test_error_page():
    response = app.test_client().get('/x')
    assert response.status_code == 404
