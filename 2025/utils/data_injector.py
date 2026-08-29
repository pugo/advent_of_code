
import argparse
from abc import ABC, abstractmethod
from typing import List, Callable


class DataInjector(ABC):
    TAG_INJECTORS = {}

    def __init__(self):
        self._input = None
        self._target = None
        self._output = None

        self._ps = []
        self._data = None
        self._datasets = {}

        self._parse_args()

    def _parse_args(self) -> None:
        """
        Parse command line arguments.
        """
        parser = argparse.ArgumentParser(description='AoC data injector')

        parser.add_argument('--input', '-i', action='store', required=True, help='Input data file')
        parser.add_argument('--target', '-t', action='store', required=True, help='Target PS file')
        parser.add_argument('--output', '-o', action='store', required=True, help='Output PS file')

        args = parser.parse_args()

        self._input = args.input
        self._target = args.target
        self._output = args.output

    def read(self) -> None:
        with open(self._input, 'r') as f:
            self._data = f.read()

        with open(self._target, 'r') as f:
            ps = f.read()
            self._ps = ps.split('\n')

    def _add_dataset(self, tag: str, dataset: List[str] ):
        self._datasets[tag] = dataset

    @abstractmethod
    def parse_data(self) -> None:
        pass

    def __inject_tag(self, tag: str, generator: Callable) -> None:
        data = generator(self)

        i = 0
        while i < len(self._ps):
            line = self._ps[i]
            if tag in line:
                new_lines = data.split('\n')
                self._ps[i:i + 1] = new_lines
                i += len(new_lines)
            else:
                i += 1

    def inject(self) -> None:
        for tag, generator in self.TAG_INJECTORS.items():
            self.__inject_tag(tag, generator)

    def write(self) -> None:
        with open(self._output, 'w') as f:
            f.write('\n'.join(self._ps))
