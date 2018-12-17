#ifndef MVCMODEL_H
#define MVCMODEL_H
#include <glad/glad.h>

using namespace std;

struct vec3{
    float x;
    float y;
    float z;
};

class MVCModel{
    public:
        vec3 color;

        MVCModel();
        ~MVCModel();
        void draw();
    private:
        unsigned int VAO;
        float* getCircle(int number_of_point);
};

#endif