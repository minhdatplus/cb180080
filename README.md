# Documentation
<!-- vscode-markdown-toc -->
* [Mô hình kiến trúc hệ thống](#Architecture)
* [Môi trường, thiết bị, công cụ sử dụng](#Enviroment)
* [Cài đặt dịch vụ](#Setup)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

## <a name='About'></a>Mô hình hệ thống
![alt text](https://github.com/minhdatplus/cb180080/blob/main/images/architect.png?raw=true)

### Kiến trúc chung của các microservices
![alt text](https://github.com/minhdatplus/cb180080/blob/main/images/architect-unit.png?raw=true)

🚀 

Hệ thống chia làm 2 phần chính với các serivce tương ứng
*  Thu thập dữ liệu(Ghi dữ liệu):
    * Market News Service
    * Finance Report Service
    * Historical Market Service
    * Corporate Action Service
    * Company Profile Service

*  Cung cấp dữ liệu(Đọc dữ liệu)
    * Technical Serivce
    * Fundamental Service

 🚀

## <a name='Enviroment'></a>Môi trường, thiết bị, công cụ sử dụng

- **Môi trường phát triển** - MacOS.
- **Môi trường triển khai** - CentOS 7.6.
- **Ngôn ngữ lập trình** - Java, C++, JavaScript.
- **Framework** - Spring Boot, NodeJS.
- **Thư viện** - ReactJS.
- **Mã nguồn mở** - GitLab, Ant Design.
- **Database** - Oracle Database 12c.
- **Container Platform** - Docker.
- **CI/CD** - GitLabCI.


## <a name='Setup'></a>Cài đặt dịch vụ

1. Fundamental Service

```
git clone https://git.aeit.club/master/fundamental

docker build -t fundamental-service:1.0 .

docker run -it -d -p 8080:8080 fundamental-service:1.0 .
```

2. Market News Service

```
git clone https://github.com/minhdatplus/crawl-news
```

Thay đổi đường dẫn trong file application.properties với đường dẫn của database và fundametal-service đã triển khai phía trên

```
url.fundamental.host=<fundamental_service_url>

spring.datasource.url=jdbc:oracle:thin:@<database_url>:1521:xe
```

Sau đó tiến hành build docker image theo lệnh bên dưới
```
docker build -t market-news-service:1.0 .

docker run -it -d -p 8080:8080 market-news-service:1.0 .
```

3. Finance Report Service

```
git clone https://github.com/minhdatplus/crawl-finance
```

Thay đổi đường dẫn trong file application.properties với đường dẫn của database và fundametal-service đã triển khai phía trên

```
url.fundamental.host=<fundamental_service_url>

spring.datasource.url=jdbc:oracle:thin:@<database_url>:1521:xe
```

Sau đó tiến hành build docker image theo lệnh bên dưới
```
docker build -t finance-report-service:1.0 .

docker run -it -d -p 8080:8080 finance-report-service:1.0 .
```

4. Historical Market Service

```
git clone https://github.com/minhdatplus/crawl-dailystock
```

Thay đổi đường dẫn trong file application.properties với đường dẫn của database và fundametal-service đã triển khai phía trên

```
url.fundamental.host=<fundamental_service_url>

spring.datasource.url=jdbc:oracle:thin:@<database_url>:1521:xe
```

Sau đó tiến hành build docker image theo lệnh bên dưới
```
docker build -t historical-market-service:1.0 .

docker run -it -d -p 8080:8080 historical-market-service:1.0 .
```

5. Corporate Action Service

```
git clone https://github.com/minhdatplus/crawl-corporate
```

Thay đổi đường dẫn trong file application.properties với đường dẫn của database và fundametal-service đã triển khai phía trên

```
url.fundamental.host=<fundamental_service_url>

spring.datasource.url=jdbc:oracle:thin:@<database_url>:1521:xe
```

Sau đó tiến hành build docker image theo lệnh bên dưới
```
docker build -t corporate-action-service:1.0 .

docker run -it -d -p 8080:8080 corporate-action-service:1.0 .
```

6. Company Profile Service

```
git clone https://github.com/minhdatplus/crawl-companyprofile
```

Thay đổi đường dẫn trong file application.properties với đường dẫn của database và fundametal-service đã triển khai phía trên

```
url.fundamental.host=<fundamental_service_url>

spring.datasource.url=jdbc:oracle:thin:@<database_url>:1521:xe
```

Sau đó tiến hành build docker image theo lệnh bên dưới
```
docker build -t company-profile-service:1.0 .

docker run -it -d -p 8080:8080 company-profile-service:1.0 .
```

7. Technical Service

```
git clone https://git.aeit.club/master/historical

docker-compose up --build
```

8. Single Page Application

```
git clone https://git.aeit.club/master/stocker

npm install

npm run start:dev
```

9. Amibroker pluginn

Building using Visual Studio 2019 and `vcpkg`
Visual Studio 2019 install with feature `Desktop development with C++` and `Individual feature: Windows 10 SDK, MSVC v140 - VS 2015 C++ buiding tools (v14.00)`

### Install `vcpkg`
### Install vcpkg via `git` source:
    git clone https://github.com/Microsoft/vcpkg.git
    cd vcpkg
    ./bootstrap-vcpkg.sh
###  Custom triplet
Edit default windows triplet: `x86-windows`, `x64-windows` :

```
#%vcpkg_root%/triplets/x64-windows.cmake
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_PLATFORM_TOOLSET "v140")
set(VCPKG_DEP_INFO_OVERRIDE_VARS "v140")

#%vcpkg_root%/triplets/x86-windows.cmake
set(VCPKG_TARGET_ARCHITECTURE x86)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_PLATFORM_TOOLSET "v140")
set(VCPKG_DEP_INFO_OVERRIDE_VARS "v140")
```

### Install `cpprestsdk` via `vcpkg` and integrate with Visual Studio
```
cd %vcpkg_root%
vcpkg install cpprestsdk
vcpkg install cpprestsdk:x64-windows
vcpkg integrate project
```
Copy output last command and run it in `Visual Studio`

