#!/usr/bin/env python3

import sys
sys.path.insert(0, "../utils")
import data_injector


class Injector(data_injector.DataInjector):
    def parse_data(self) -> None:
        intervals = []
        lines = self._data.split('\n')

        for line in lines:
            intervals.extend([i for i in line.split(',') if i])

        self._add_dataset('intervals', intervals)

    def generate_data(self) -> str:
        lines = []

        for interval in self._datasets['intervals']:
            if interval:
                start, end = interval.split('-')
                lines.append(f'[{start} {end}]')

        return '\n'.join(lines)

    TAG_INJECTORS = {
        '<<INJECT DATA HERE>>': generate_data,
    }


if __name__ == '__main__':
    injector = Injector()
    injector.read()
    injector.parse_data()
    injector.inject()
    injector.write()