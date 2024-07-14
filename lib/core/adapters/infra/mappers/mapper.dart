abstract base class Mapper<E, M> {
  E toEntity(M model);
  M toModel(E entity);
}
