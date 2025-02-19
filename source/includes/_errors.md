# Errors

GoCD uses the following HTTP status codes to indicate errors.

Error Code | Meaning
-----------|--------
400        | Bad Request           -- The request could not be understood. The client SHOULD NOT repeat the request without modifications.
401        | Unauthorized          -- Your username or password is incorrect or you are not authorized to perform this action.
403        | Forbidden             -- The resource requested is hidden for administrators only.
404        | Not Found             -- The specified resource could not be found.
405        | Method Not Allowed    -- You tried to access a resource with an invalid method.
406        | Not Acceptable        -- You requested a format that isn't json.
409        | Conflict              -- The request could not be completed due to a conflict with the current state of the resource.
410        | Gone                  -- The resource requested has been removed from our servers.
412        | Precondition Failed   -- The request could not be completed because the state of the resource is not the latest while being updated.
422        | Unprocessable Entity  -- The server understood the request, but the request is semantically erroneous.
500        | Internal Server Error -- We had a problem with our server. Try again later.
501        | Not implemented       -- The server does not support the functionality required to fulfill the request.
503        | Service Unavailable   -- We're temporarially offline for maintanance. Please try again later.
