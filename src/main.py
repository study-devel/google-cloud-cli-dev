def hello_world(request):
    """
    HTTP Cloud Function.
    request (flask.Request): The request object.
    """
    return "Hello, World!", 200


def hello_world_deploy(request):
    """
    HTTP Cloud Function.
    request (flask.Request): The request object.
    """
    return "Hello, World! Git Action", 200