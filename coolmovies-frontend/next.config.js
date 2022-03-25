/** @type {import('next').NextConfig} */
module.exports = {
  async rewrites() {
    return [
      {
        source: '/graphql',
        destination: process.env.GRAPHQL_URL,
      },
    ];
  },
  reactStrictMode: true,
  images: { domains: ['upload.wikimedia.org', 'images-na.ssl-images-amazon.com'] }
};
