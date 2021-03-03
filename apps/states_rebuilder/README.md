# movie_app_demo_flutter

This is an implementation of 'Flutter State Management: Movie App' using `states_rebuilder`.

## Notes:

* I did not touch the `core` part. I took it as it is and just consume it.
* By default, `states_rebuilder` tracks the state status and exposes six flags:
    * `isIdle`: after the state is first created and before any operation (virgin status).
    * `isWaiting`: When the state is waiting for an async task (Future or Stream).
    * `hasError`: If the state caught an exception.
    * `hasData`: when the state is mutated successfully with valid data
    * `isDone`: when the state's stream is done.
    * `isActive`: changed manually to mark whether the state is active or not.
* If the sole purpose of using Freezed is to track one of the six state status, then it is no longer necessary to use it.
* I do not use `favouriteMovies` that use `RxDart`. Instead, I combined two injected states.
* All the functionalities of the app are tested.
