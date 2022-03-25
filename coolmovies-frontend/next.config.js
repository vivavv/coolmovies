/** @type {import('next').NextConfig} */
module.exports = {
  async rewrites() {
    return [
      {
        source: '/graphql',
        destination: 'http://localhost:5001/graphql',
      },
    ];
  },
  reactStrictMode: true,
  images: { domains: ['upload.wikimedia.org', 'images-na.ssl-images-amazon.com'] }
};
