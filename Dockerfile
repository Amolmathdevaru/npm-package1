FROM node:alpine as builder 
#builder is nothing but name of this phase 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]


FROM nginx 
#just copy the content of build folder.
COPY --from=builder /app/build /usr/share/nginx/html


