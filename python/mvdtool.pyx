# -*- coding: utf-8 -*-
# =====================================================================================================================
# These bindings were automatically generated by cyWrap. Please do dot modify.
# Additional functionality shall be implemented in sub-classes.
#
__copyright__ = "Copyright 2016 EPFL BBP-project"
# =====================================================================================================================
from cython.operator cimport dereference as deref
from libcpp cimport bool
cimport std
cimport MVD
cimport MVD2
cimport MVD3
from libcpp.memory cimport unique_ptr
cimport boost
cimport MVD_MVDType
import numpy

cdef enum OPERATOR:
    LESS = 0, LESS_EQUAL, EQUAL, DIFF, GREATER, GREATER_EQUAL


cdef class _py__base:
    cdef void *_ptr
    # Basic comparison is done by comparing the inner obj ptr
    def __richcmp__(_py__base self, _py__base other, operation):
        if operation == OPERATOR.EQUAL:
            return self._ptr==other._ptr


# ----------------------------------------------------------------------------------------------------------------------
cdef class MVDFile(_py__base):
# ----------------------------------------------------------------------------------------------------------------------
    cdef MVD.MVDFile * ptr0(self):
        return <MVD.MVDFile*> self._ptr

    def getNbNeuron(self, ):
        return self.ptr0().getNbNeuron()

    def getPositions(self, _MVD_Range range_=None):
        cdef MVD.Positions* posics
        if range_ is None:
            posics = new MVD.Positions(self.ptr0().getPositions())
        else:
            posics = new MVD.Positions(self.ptr0().getPositions(deref(range_.ptr())))
        cdef double *addr = posics.data()
        cdef const boost.size_type* shape = posics.shape()
        cdef int x1=shape[0], x2=shape[1]
        # We might have a data copy here... and miss the release of the allocated obj...
        # We might do it manually in the future (numpy API)
        cdef double[:,::1]y = <double[:x1,:x2]> addr
        return numpy.asarray(y)

    def getRotations(self, _MVD_Range range_=None):
        cdef MVD.Rotations *rots
        if range_ is None:
            rots = new MVD.Rotations(self.ptr0().getRotations())
        else:
            rots = new MVD.Rotations(self.ptr0().getRotations(deref(range_.ptr())))
        cdef double *addr = rots.data()
        cdef const boost.size_type* shape = rots.shape()
        cdef int x1=shape[0], x2=shape[1]
        cdef double[:,::1]y = <double[:x1,:x2]> addr
        return numpy.asarray(y)



# ======================================================================================================================
# Python bindings to namespace MVD2
# ======================================================================================================================


# ----------------------------------------------------------------------------------------------------------------------
cdef class MVD2File(MVDFile):
    "Python wrapper class for MVD2File (ns=MVD2)"
# ----------------------------------------------------------------------------------------------------------------------
    cdef unique_ptr[MVD2.MVD2File] _autodealoc
    cdef MVD2.MVD2File *ptr(self):
        return <MVD2.MVD2File*> self._ptr

    def __init__(self, std.string filename):
        self._ptr = new MVD2.MVD2File(filename)
        self._autodealoc.reset(self.ptr())

    def getNbMorphoType(self, ):
        return self.ptr().getNbMorphoType()

    def getNbMorpho(self, ):
        return self.ptr().getNbMorpho()

    def getNbColumns(self, ):
        return self.ptr().getNbColumns()


    @staticmethod
    cdef MVD2File from_ptr(MVD2.MVD2File *ptr):
        cdef MVD2File obj = MVD2File.__new__(MVD2File)
        obj._ptr = ptr
        obj._autodealoc.reset(obj.ptr())
        return obj

    @staticmethod
    cdef MVD2File from_ref(const MVD2.MVD2File &ref):
        return MVD2File.from_ptr(<MVD2.MVD2File*>&ref)

    @staticmethod
    cdef list vector2list( std.vector[MVD2.MVD2File*] vec ):
        return [ MVD2File.from_ptr(elem) for elem in vec ]




# ======================================================================================================================
# Python bindings to namespace MVD3
# ======================================================================================================================


# ----------------------------------------------------------------------------------------------------------------------
cdef class _MVD_Range(_py__base):
    "Python wrapper class for Range (ns=MVD3)"
# ----------------------------------------------------------------------------------------------------------------------
    cdef unique_ptr[MVD.Range] _autodealoc
    cdef MVD.Range *ptr(self):
        return <MVD.Range*> self._ptr


    def __init__(self, std.size_t offset_=0, std.size_t count_=0):
        self._ptr = new MVD.Range(offset_, count_)
        self._autodealoc.reset(self.ptr())

    @staticmethod
    cdef _MVD_Range from_ptr(MVD.Range *ptr):
        cdef _MVD_Range obj = _MVD_Range.__new__(_MVD_Range)
        obj._ptr = ptr
        obj._autodealoc.reset(obj.ptr())
        return obj

    @staticmethod
    cdef _MVD_Range from_ref(const MVD.Range &ref):
        return _MVD_Range.from_ptr(<MVD.Range*>&ref)

    @staticmethod
    cdef list vector2list( std.vector[MVD.Range*] vec ):
        return [ _MVD_Range.from_ptr(elem) for elem in vec ]



# ----------------------------------------------------------------------------------------------------------------------
cdef class MVD3File(MVDFile):
    "Python wrapper class for MVD3File (ns=MVD3)"
# ----------------------------------------------------------------------------------------------------------------------
    cdef unique_ptr[MVD3.MVD3File] _autodealoc
    cdef MVD3.MVD3File *ptr(self):
        return <MVD3.MVD3File*> self._ptr

    def __init__(self, std.string filename):
        self._ptr = new MVD3.MVD3File(filename)
        self._autodealoc.reset(self.ptr())

    def getMorphologies(self, _MVD_Range range):
        return self.ptr().getMorphologies(deref(range.ptr()))

    def getEtypes(self, _MVD_Range range):
        return self.ptr().getEtypes(deref(range.ptr()))

    def getMtypes(self, _MVD_Range range):
        return self.ptr().getMtypes(deref(range.ptr()))

    def getSynapseClass(self, _MVD_Range range):
        return self.ptr().getSynapseClass(deref(range.ptr()))

    def getIndexMorphologies(self, _MVD_Range range):
        return self.ptr().getIndexMorphologies(deref(range.ptr()))

    def getIndexEtypes(self, _MVD_Range range):
        return self.ptr().getIndexEtypes(deref(range.ptr()))

    def getIndexMtypes(self, _MVD_Range range):
        return self.ptr().getIndexMtypes(deref(range.ptr()))

    def getIndexSynapseClass(self, _MVD_Range range):
        return self.ptr().getIndexSynapseClass(deref(range.ptr()))

    def listAllMorphologies(self):
        return self.ptr().listAllMorphologies()

    def listAllEtypes(self):
        return self.ptr().listAllEtypes()

    def listAllMtypes(self):
        return self.ptr().listAllMtypes()

    def listAllSynapseClass(self):
        return self.ptr().listAllSynapseClass()

    def getCircuitSeeds(self):
        return self.ptr().getCircuitSeeds()

    @staticmethod
    cdef MVD3File from_ptr(MVD3.MVD3File *ptr):
        cdef MVD3File obj = MVD3File.__new__(MVD3File)
        obj._ptr = ptr
        obj._autodealoc.reset(obj.ptr())
        return obj

    @staticmethod
    cdef MVD3File from_ref(const MVD3.MVD3File &ref):
        return MVD3File.from_ptr(<MVD3.MVD3File*>&ref)

    @staticmethod
    cdef list vector2list( std.vector[MVD3.MVD3File*] vec ):
        return [ MVD3File.from_ptr(elem) for elem in vec ]




# ======================================================================================================================
# Python bindings to namespace MVD
# ======================================================================================================================

class MVDType(object):
    _UnknownFileType = MVD_MVDType.UnknownFileType
    _MVD2 = MVD_MVDType.MVD2
    _MVD3 = MVD_MVDType.MVD3
    _ITEMS = {_UnknownFileType: "UnknownFileType",
              _MVD2: "MVD2",
              _MVD3: "MVD3"}

    def __init__(self, typ):
        assert typ in self._ITEMS
        self._id = typ

    def __eq__(self, other):
        return isinstance(other, type(self)) and self._id == other._id

    def __repr__(self):
        return "<MVDType.%s>" % (self._ITEMS[self._id])

# Actual "Enum" instances
MVDType.UnknownFileType = MVDType(MVDType._UnknownFileType)
MVDType.MVD2 = MVDType(MVDType._MVD2)
MVDType.MVD3 = MVDType(MVDType._MVD3)


def is_mvd_file(std.string filename):
    return MVDType(MVD.is_mvd_file(filename))


def open_mvd(std.string filename):
    """Open either MVD2 or MVD3 and return an actual MVD2File or MVD3File object
    """
    if MVD.is_mvd_file(filename) == MVD_MVDType._MVD2:
        return MVD2File(filename)
    return MVD3File(filename)


# #####################################################
# NAMESPACE Aliasing
#
class MVD2:
    File = MVD2File

class MVD3:
    File = MVD3File
    Range = _MVD_Range