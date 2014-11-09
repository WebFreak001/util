﻿module devisualization.util.opengl.function_wrappers.v_1_2;
import gl = derelict.opengl3.gl;
import gldepcnst = derelict.opengl3.deprecatedConstants;
public import devisualization.util.opengl.function_wrappers.v_1_0 : PixelFormat, BindTextureTarget, InternalFormat, PixelDataType;
public import devisualization.util.opengl.function_wrappers.v_1_1 : Primitives;

enum BlendMode {
    FuncAdd = gldepcnst.GL_FUNC_ADD,
    FuncSubtract = gldepcnst.GL_FUNC_SUBTRACT,
    FuncReverseSubtract = gldepcnst.GL_FUNC_REVERSE_SUBTRACT,
    Min = gldepcnst.GL_MIN,
    Max = gldepcnst.GL_MAX
}

enum TextureTargets {
    Texture3D = gl.GL_TEXTURE_3D,
    ProxyTexture3D = gl.GL_PROXY_TEXTURE_3D,
    Texture2DArray = gl.GL_TEXTURE_2D_ARRAY,
    ProxyTexture2DArray = gl.GL_PROXY_TEXTURE_2D_ARRAY
}

enum SubTextureTargets {
    Texture3D = gl.GL_TEXTURE_3D,
    Texture2DArray = gl.GL_TEXTURE_2D_ARRAY,
}

enum PixelSubTextureFormat {
    Red = gl.GL_RED,
    RG = gl.GL_RG,
    RGB = gl.GL_RGB,
    BGR = gl.GL_BGR,
    RGBA = gl.GL_RGBA,
    StencilIndex = gl.GL_STENCIL_INDEX,
    DepthComponent = gl.GL_DEPTH_COMPONENT
}

void glBlendColor(ubyte r, ubyte g, ubyte b, ubyte a) {
    gl.glBlendColor(r / 255f, g / 255f, b / 255f, a / 255f);
}

void glBlendEquation(BlendMode mode) {
    gl.glBlendEquation(cast(gl.GLenum)mode);
}

void glDrawRangeElements(Primitives mode, gl.GLuint start, gl.GLuint end, ubyte[] data) {
    gl.glDrawRangeElements(cast(gl.GLenum)mode, start, end, cast(uint)data.length, gl.GL_UNSIGNED_BYTE, data.ptr);
}

void glDrawRangeElements(Primitives mode, gl.GLuint start, gl.GLuint end, ushort[] data) {
    gl.glDrawRangeElements(cast(gl.GLenum)mode, start, end, cast(uint)data.length, gl.GL_UNSIGNED_SHORT, data.ptr);
}

void glDrawRangeElements(Primitives mode, gl.GLuint start, gl.GLuint end, uint[] data) {
    gl.glDrawRangeElements(cast(gl.GLenum)mode, start, end, cast(uint)data.length, gl.GL_UNSIGNED_INT, data.ptr);
}

void glTexImage3D(BindTextureTarget target, int level, InternalFormat internalFormat, int width, int height, int depth, PixelFormat format, PixelDataType type, void[] data) {
    gl.glTexImage3D(cast(gl.GLenum)target, level, cast(gl.GLenum)internalFormat, width, height, depth, 0, cast(gl.GLenum)format, cast(gl.GLenum)type, data.ptr);
}

void glTexImage3D(TextureTargets target, int level, InternalFormat internalFormat, int width, int height, int depth, PixelFormat format, PixelDataType type, void[] data) {
    gl.glTexImage3D(cast(gl.GLenum)target, level, cast(gl.GLenum)internalFormat, width, height, depth, 0, cast(gl.GLenum)format, cast(gl.GLenum)type, data.ptr);
}

void glTexSubImage3D(SubTextureTargets target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, PixelSubTextureFormat format, PixelDataType type, void[] data) {
    gl.glTexSubImage3D(cast(gl.GLenum)target, level, xoffset, yoffset, zoffset, width, height, depth, cast(gl.GLenum)format, cast(gl.GLenum)type, data.ptr);
}

void glCopyTexSubImage3D(SubTextureTargets target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height) {
    gl.glCopyTexSubImage3D(cast(gl.GLenum)target, level, xoffset, yoffset, zoffset, x, y, width, height);
}