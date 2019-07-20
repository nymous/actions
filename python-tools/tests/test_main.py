import pytest

from .main import multiply


def test_multiply():
    assert multiply(2, 3) == 6
    assert multiply(-3, 5) == -15
    assert multiply(0, 4) == 0
    with pytest.raises(TypeError):
        multiply("abc", 1.2)
