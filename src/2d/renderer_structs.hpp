#include <cstdlib>
#include <ctgmath> // for cos()

// Structs

typedef struct {float x,y,w;} canvas_vec3_t;

typedef struct {canvas_vec3_t c0,c1,c2;} canvas_mat3_t;

// Matrix and vector arithmetic functions

// Matrix unpacker (pass dest. matrix by reference!)

inline void unpack_matrix(canvas_mat3_t src,float* dest) {
    *dest=src.c0.x;
    *(dest+(1*sizeof(float)))=src.c0.y;
    *(dest+(2*sizeof(float)))=src.c0.w;
    *(dest+(3*sizeof(float)))=src.c1.x;
    *(dest+(4*sizeof(float)))=src.c1.y;
    *(dest+(5*sizeof(float)))=src.c1.w;
    *(dest+(6*sizeof(float)))=src.c2.x;
    *(dest+(7*sizeof(float)))=src.c2.y;
    *(dest+(8*sizeof(float)))=src.c2.w;
}

// Change order of matrices

inline canvas_mat3_t change_matorder(canvas_mat3_t src) {
    float temp_matrix[3][3];
    canvas_mat3_t result={{}};
    return result;
}

// Identity matrix loader

inline canvas_mat3_t canvas_loadidentity() {
    float new_matrix[3][3];
    size_t mat_size=3; size_t matx=0; size_t maty=0;

    // Fill with zeros

    for(;maty<mat_size;maty++) {
    	for(;matx<mat_size;matx++) {
    	    new_matrix[maty][matx]=0.0f;
    	}
    }

    // Write ones diagonally

    for(size_t diag=0;diag<mat_size;diag++) {
    	new_matrix[diag][diag]=1.0f;
    }

    canvas_mat3_t result={{new_matrix[0][0],
    			   new_matrix[0][1],
    			   new_matrix[0][2]},{
    			   new_matrix[1][0],
    			   new_matrix[1][1],
    			   new_matrix[1][2]},{
    			   new_matrix[2][0],
    			   new_matrix[2][1],
    			   new_matrix[2][2]}};

    return result;
}

inline float canvas_dotprod(canvas_vec3_t lhs,canvas_vec3_t rhs) {
    float result=0.0f; size_t n=3;
    // Unpack vectors into 1D arrays
    float a[3]={lhs.x,lhs.y,lhs.w}; float b[3]={rhs.x,rhs.y,rhs.w};
    for(size_t i=0;i<n;i++) {
    	result += a[i]*b[i];
    }
    return result;
}

inline canvas_mat3_t matrix_mul(canvas_mat3_t lhs,canvas_mat3_t rhs) {
    canvas_mat3_t result=;
    return result;
}
