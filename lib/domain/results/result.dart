sealed class Result<S, F> {}

class Success<S, F> extends Result<S, F> {
  final S data;

  Success(this.data);
}

class Failure<S, F> extends Result<S, F> {
  final F error;

  Failure(this.error);
}
