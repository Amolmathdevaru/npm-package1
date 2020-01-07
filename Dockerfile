FROM node:alpine as  builder 
#builder is nothing but name of this phase 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx 
#EXPOSE 80
#just copy the content of build folder.
COPY --from=builder /app/build /usr/share/nginx/html


