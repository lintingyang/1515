package tw.com.softleader.e5e5.common.dao;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.jpa.domain.Specification;


public class CommonQueryPattern<T> implements Specification<T> {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	private final List<CommonCriterion> criterions;
	

	public CommonQueryPattern(final List<CommonCriterion> criterions) {
		this.criterions = criterions;
	}
	
	@SuppressWarnings({"unchecked", "rawtypes"})
	@Override
	public Predicate toPredicate(final Root<T> root, final CriteriaQuery<?> query, final CriteriaBuilder cb) {
		
		// if has distinct field
		Predicate predicate = cb.conjunction();

		String field;
		Object value;
		QueryOpType op;

		List<CommonCriterion> orCriterions;

		for (final CommonCriterion criterion : criterions) {

			field = criterion.getField();
			value = criterion.getValue();
			op = criterion.getOp();


			orCriterions = criterion.getOrCriterions();

			if (orCriterions != null && orCriterions.size() > 0) {

				final Predicate orPredicate = cb.disjunction();
				for (final CommonCriterion orCriterion : orCriterions) {
					final Expression expression = getExpression(root, query, cb, orCriterion.getOp(), orCriterion.getField(), orCriterion.getValue());
					log.debug("{}", expression);
					orPredicate.getExpressions().add(expression);
				}

				predicate = cb.and(predicate, orPredicate);

			} else {
				final Expression expression = getExpression(root, query, cb, op, field, value);
				// log.debug("{}", expression);
				predicate.getExpressions().add(expression);
			}


			
			
			//
			// if("or".equalsIgnoreCase(logical)) {
			// predicate = cb.or(predicate, expression);
			// } else { //default using "AND"
			// predicate = cb.and(predicate, expression);
			// }

		}

		
		return predicate;
	}


	@SuppressWarnings("rawtypes")
	private Expression getExpression(final Root<T> root, final CriteriaQuery<?> query, final CriteriaBuilder cb, final QueryOpType op,
			final String field, final Object value) {
		Expression expression = null;

		if (QueryOpType.EQ.equals(op)) {
			expression = cb.equal(root.get(field), value);
		} else if (QueryOpType.LIKE.equals(op)) {
			expression = cb.like(root.<String>get(field), value.toString());
		} else if (QueryOpType.GE.equals(op)) {
			if (value instanceof Number) {
				expression = cb.ge(root.<Number>get(field), (Number) value);
			} else if (value instanceof LocalDateTime) {
				expression = cb.greaterThanOrEqualTo(root.<LocalDateTime>get(field), (LocalDateTime) value);
			} else if (value instanceof LocalDate) {
				expression = cb.greaterThanOrEqualTo(root.<LocalDate>get(field), (LocalDate) value);
			}
		} else if (QueryOpType.GT.equals(op)) {
			if (value instanceof Number) {
				expression = cb.gt(root.<Number>get(field), (Number) value);
			} else if (value instanceof LocalDateTime) {
				expression = cb.greaterThan(root.<LocalDateTime>get(field), (LocalDateTime) value);
			} else if (value instanceof LocalDate) {
				expression = cb.greaterThan(root.<LocalDate>get(field), (LocalDate) value);
			}

		} else if (QueryOpType.LE.equals(op)) {
			if (value instanceof Number) {
				expression = cb.le(root.<Number>get(field), (Number) value);
			} else if (value instanceof LocalDateTime) {
				expression = cb.lessThanOrEqualTo(root.<LocalDateTime>get(field), (LocalDateTime) value);
			} else if (value instanceof LocalDate) {
				expression = cb.lessThanOrEqualTo(root.<LocalDate>get(field), (LocalDate) value);
			}
		} else if (QueryOpType.LT.equals(op)) {
			if (value instanceof Number) {
				expression = cb.lt(root.<Number>get(field), (Number) value);
			} else if (value instanceof LocalDateTime) {
				expression = cb.lessThan(root.<LocalDateTime>get(field), (LocalDateTime) value);
			} else if (value instanceof LocalDate) {
				expression = cb.lessThan(root.<LocalDate>get(field), (LocalDate) value);
			}

		} else if (QueryOpType.BETWEEN.equals(op)) {
			if (!(value instanceof Object[])) {
				log.error("YOU should use Object[2] as value");
				throw new RuntimeException("error.queryOpType.between");
			}

			if (value instanceof LocalDateTime[]) {

				final LocalDateTime[] values = (LocalDateTime[]) value;
				if (values.length != 2) {
					log.error("YOU should use LocalDateTime[2] as value");
					throw new RuntimeException("error.queryOpType.between");
				}

				expression = cb.between(root.<LocalDateTime>get(field), values[0], values[1]);

			} else if (value instanceof LocalDate[]) {

				final LocalDate[] values = (LocalDate[]) value;
				if (values.length != 2) {
					log.error("YOU should use LocalDate[2] as value");
					throw new RuntimeException("error.queryOpType.between");
				}
				expression = cb.between(root.<LocalDate>get(field), values[0], values[1]);
			} else if (value instanceof String[]) {

				final String[] values = (String[]) value;
				if (values.length != 2) {
					log.error("YOU should use String[2] as value");
					throw new RuntimeException("error.queryOpType.between");
				}
				expression = cb.between(root.<String>get(field), values[0], values[1]);
			}

		} else if (QueryOpType.IN.equals(op)) {
			final Object[] inValues = (Object[]) value;
			expression = root.get(field).in(inValues);

		} else if (QueryOpType.NOTNULL.equals(op)) {
			expression = cb.isNotNull(root.get(field));

		} else if (QueryOpType.NULL.equals(op)) {
			expression = cb.isNull(root.get(field));

		} else if (QueryOpType.NEQ.equals(op)) {
			expression = cb.notEqual(root.get(field), value);
		} else {
			// ... other
			log.error("Not found pattern {} {} {}", op, field, value);
		}

		return expression;
	}
}
