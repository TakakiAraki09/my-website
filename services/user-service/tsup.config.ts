import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/User.tsx'],
  outDir: 'dist',
  format: 'cjs',
  dts: true,
  splitting: true,
  sourcemap: true,
  clean: true,
  minify: false,
  shims: true,
});
