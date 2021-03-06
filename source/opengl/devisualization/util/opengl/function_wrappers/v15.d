﻿/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 Devisualization (Richard Andrew Cattermole)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
module devisualization.util.opengl.function_wrappers.v15;
import gl = derelict.opengl3.gl;
import glarb = derelict.opengl3.arb;

// no need to polute name space any further when its args don't change
public import derelict.opengl3.gl : glIsQuery, glIsBuffer;

enum QueryTargets {
    SamplesPassed = gl.GL_SAMPLES_PASSED,
    AnySamplesPassed = gl.GL_ANY_SAMPLES_PASSED,
    AnySamplesPassedConservative = gl.GL_ANY_SAMPLES_PASSED_CONSERVATIVE,
    PrimitivesGenerated = gl.GL_PRIMITIVES_GENERATED,
    TransformFeedbackPrimitivesWritten = gl.GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN,
    TimeElapsed = gl.GL_TIME_ELAPSED
}

enum QueryTarget {
    SamplesPassed = gl.GL_SAMPLES_PASSED,
    AnySamplesPassed = gl.GL_ANY_SAMPLES_PASSED,
    AnySamplesPassedConservative = gl.GL_ANY_SAMPLES_PASSED_CONSERVATIVE,
    PrimitivesGenerated = gl.GL_PRIMITIVES_GENERATED,
    TransformFeedbackPrimitivesWritten = gl.GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN,
    TimeElapsed = gl.GL_TIME_ELAPSED,
    TimeStamp = gl.GL_TIMESTAMP
}

enum QueryNames {
    CurrentQuery = gl.GL_CURRENT_QUERY,
    QueryCounterBits = gl.GL_QUERY_COUNTER_BITS
}

enum QueryResultNames {
    Result = gl.GL_QUERY_RESULT,
    ResultAvailable = gl.GL_QUERY_RESULT_AVAILABLE
}

enum BindBufferTargets {
    ArrayBuffer = gl.GL_ARRAY_BUFFER,
    AtomicCounterBuffer = gl.GL_ATOMIC_COUNTER_BUFFER,
    CopyReadBuffer = gl.GL_COPY_READ_BUFFER,
    CopyWriteBuffer = gl.GL_COPY_WRITE_BUFFER,
    DrawIndirectBuffer = gl.GL_DRAW_INDIRECT_BUFFER,
    DispatchIndirectBuffer = gl.GL_DISPATCH_INDIRECT_BUFFER,
    ElementArrayBuffer = gl.GL_ELEMENT_ARRAY_BUFFER,
    PixelPackBuffer = gl.GL_PIXEL_PACK_BUFFER,
    PixelUnpackBuffer = gl.GL_PIXEL_UNPACK_BUFFER,
    QueryBuffer = gl.GL_QUERY_BUFFER,
    ShaderStorageBuffer = gl.GL_SHADER_STORAGE_BUFFER,
    TextureBuffer = gl.GL_TEXTURE_BUFFER,
    TransformFeedbackBuffer = gl.GL_TRANSFORM_FEEDBACK_BUFFER,
    UniformBuffer = gl.GL_UNIFORM_BUFFER
}

enum BufferUsages {
    StreamDraw = gl.GL_STREAM_DRAW,
    StreamRead = gl.GL_STREAM_READ,
    StreamCopy = gl.GL_STREAM_COPY,
    StaticDraw = gl.GL_STATIC_DRAW,
    StaticRead = gl.GL_STATIC_READ,
    StaticCopy = gl.GL_STATIC_COPY,
    DynamicDraw = gl.GL_DYNAMIC_DRAW,
    DynamicRead = gl.GL_DYNAMIC_READ,
    DynamicCopy = gl.GL_DYNAMIC_COPY
}

enum BufferAccess {
    ReadOnly = gl.GL_READ_ONLY,
    WriteOnly = gl.GL_WRITE_ONLY,
    ReadWrite = gl.GL_READ_WRITE
}

enum GetBufferTargets {
    ArrayBuffer = gl.GL_ARRAY_BUFFER,
    ElementArrayBuffer = gl.GL_ELEMENT_ARRAY_BUFFER
}

enum GetBufferValues {
    BufferSize = gl.GL_BUFFER_SIZE,
    BufferUsage = gl.GL_BUFFER_USAGE
}

uint[] glGenQueries(int n) {
    uint[] ret;
    gl.glGenQueries(n, ret.ptr);
    return ret;
}

uint glGenQueries() {
    uint ret;
    gl.glGenQueries(1, &ret);
    return ret;
}

void glDeleteQueries(uint[] ids) {
    gl.glDeleteQueries(cast(uint) ids.length, ids.ptr);
}

void glDeleteQueries(uint id) {
    gl.glDeleteQueries(1, &id);
}

void glBeginQuery(QueryTargets target, uint id) {
    gl.glBeginQuery(cast(gl.GLenum)target, id);
}

void glEndQuery(QueryTargets target) {
    gl.glEndQuery(cast(gl.GLenum)target);
}

void glGetQueryiv(QueryTarget target, QueryNames pname, int[] params) {
    gl.glGetQueryiv(cast(gl.GLenum)target, cast(gl.GLenum)pname, params.ptr);
}

int[] glGetQueryObjectiv(uint id, QueryResultNames pname) {
    int[] ret;
    gl.glGetQueryObjectiv(id, cast(gl.GLenum)pname, ret.ptr);
    return ret;
}

uint[] glGetQueryObjectuiv(uint id, QueryResultNames pname) {
    uint[] ret;
    gl.glGetQueryObjectuiv(id, cast(gl.GLenum)pname, ret.ptr);
    return ret;
}

long[] glGetQueryObjecti64v(uint id, QueryResultNames pname) {
    long[] ret;
    glarb.glGetQueryObjecti64v(id, cast(gl.GLenum)pname, ret.ptr);
    return ret;
}

ulong[] glGetQueryObjectui64v(uint id, QueryResultNames pname) {
    ulong[] ret;
    glarb.glGetQueryObjectui64v(id, cast(gl.GLenum)pname, ret.ptr);
    return ret;
}

void glBindBuffer(BindBufferTargets target, uint buffer) {
    gl.glBindBuffer(cast(gl.GLenum)target, buffer);
}

void glDeleteBuffer(uint id) {
    gl.glDeleteBuffers(1, &id);
}

void glDeleteBuffers(uint[] buffers) {
    gl.glDeleteBuffers(cast(int)buffers.length, buffers.ptr);
}

uint glGenBuffer() {
    uint ret;
    gl.glGenBuffers(1, &ret);
    return ret;
}

uint[] glGenBuffers(int n) {
    uint[] ret;
    gl.glGenBuffers(n, ret.ptr);
    return ret;
}

void glBufferData(BindBufferTargets target, void[] data, BufferUsages usage) {
    gl.glBufferData(cast(gl.GLenum)target, cast(int)data.length, data.ptr, cast(gl.GLenum)usage);
}

void glBufferSubData(BindBufferTargets target, int offset, void[] data) {
    gl.glBufferSubData(cast(gl.GLenum)target, cast(int)offset, cast(int)data.length, data.ptr);
}

void glGetBufferSubData(BindBufferTargets target, int offset, ref void[] data) {
    gl.glGetBufferSubData(cast(gl.GLenum)target, cast(int)offset, cast(int)data.length, data.ptr);
}

void* glMapBuffer(BindBufferTargets target, BufferAccess access) {
    return gl.glMapBuffer(cast(gl.GLenum)target, cast(gl.GLenum)access);
}

bool glUnmapBuffer(BindBufferTargets target) {
    return cast(bool)gl.glUnmapBuffer(cast(gl.GLenum)target);
}

void glGetBufferPointerv(BindBufferTargets target, void[] params) {
    gl.glGetBufferPointerv(cast(gl.GLenum)target, gl.GL_BUFFER_MAP_POINTER, params.ptr);
}

int[] glGetBufferParameteriv(GetBufferTargets target, GetBufferValues value) {
    int[] ret;
    gl.glGetBufferParameteriv(cast(gl.GLenum)target, value, ret.ptr);
    return ret;
}