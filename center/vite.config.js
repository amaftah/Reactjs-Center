import reactRefresh from '@vitejs/plugin-react-refresh';

export default ({
  plugins: [reactRefresh()],

build: {
  rollupOptions: {
      input: {
          main: resolve(__dirname, 'App.jsx'),
      }
  }
}  
})