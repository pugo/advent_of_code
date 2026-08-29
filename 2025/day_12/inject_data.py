#!/usr/bin/env python3

import sys
sys.path.insert(0, "../utils")
import data_injector


class Injector(data_injector.DataInjector):
    def parse_data(self) -> None:
        shapes = []
        regions = []

        read_shapes = True
        for line in self._data.split('\n'):
            if 'x' in line:
                read_shapes = False

            if read_shapes:
                shapes.append(line)
            else:
                regions.append(line)

        self._add_dataset('shapes', shapes)
        self._add_dataset('regions', regions)

    def generate_shapes_data(self) -> str:
        lines = []

        shape_index = None
        shape_lines = []
        for line in self._datasets['shapes']:
            if ':' in line:
                lines.append(f'{line[:-1]} [')
                continue

            if not line:
                lines.append(']')
                lines.append('')
                continue

            lines.append(f'({line})')

        return '\n'.join(lines)

    # Generate regions as: [[4 4] [0 0 0 0 2 0]]
    def generate_regions_data(self) -> str:
        items_per_line = 4
        lines = []
        line = []        

        for l in self._datasets['regions']:
            if not l:
                continue

            p = l.split(':')
            w, l = p[0].split('x')

            line.append(f'[[{w} {l}] [{p[1].strip()}]]')
            if len(line) == items_per_line:
                lines.append(' '.join(line))
                line = []

        if line:
            lines.append(' '.join(line))

        return '\n'.join(lines)

    TAG_INJECTORS = {
        '<<INJECT SHAPES DATA HERE>>': generate_shapes_data,
        '<<INJECT REGIONS DATA HERE>>': generate_regions_data,
    }



if __name__ == '__main__':
    injector = Injector()
    injector.read()
    injector.parse_data()
    injector.inject()
    injector.write()