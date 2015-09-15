package com.cater.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.cater.menu.pizza.PizzaIngredient;
import com.cater.menu.pizza.PizzaIngredientLevel;
import com.cater.menu.pizza.PizzaMenuItem;
import com.cater.menu.pizza.StuffedEdgeType;

public class MenuDeserializerTest {
	//@Autowired
	private MenuDeserializer fixture;

	@Before
	public void setUp() throws Exception {
		fixture = new MenuDeserializer();
	}

	@After
	public void tearDown() throws Exception {
		fixture = null;
	}

	@Test
	public void testReadIndianMenu() throws IOException {
		File f = new File(MenuDeserializerTest.class.getResource(
				"/test-menus/indian_basic.json").getFile());
		System.out.println(FileUtils.readFileToString(f));
		Menu menu = fixture.readJSON(f);
		assertNotNull(menu);
		assertEquals("INDIAN", menu.getCuisine());
		assertNotNull(menu.getCategories());
		assertEquals(3, menu.getCategories().size());
		//////////////////////////////////////////////
		MenuCategory menuCategory0 = menu.getCategories().get(0);
		MenuItem item;
		assertEquals("APPETIZERS", menuCategory0.getName());
		assertNotNull(menuCategory0.getItems());
		assertEquals(2, menuCategory0.getItems().size());
		item = (MenuItem) menuCategory0.getItems().get(0);
		assertEquals("Aloo Bonda", item.getName());
		assertEquals("Lentil fritters with Potato and Peas stuffed",
				item.getDescription());
		assertFalse(item.isSelected());
		//////////////////////////////////////////////
		MenuCategory menuCategory1 = menu.getCategories().get(1);
		assertEquals("SOUPS", menuCategory1.getName());
		assertNotNull(menuCategory1.getItems());
		assertEquals(2, menuCategory1.getItems().size());
		//////////////////////////////////////////////
		MenuCategory menuCategory2 = menu.getCategories().get(2);
		assertEquals("ZERO ITEMS", menuCategory2.getName());
		assertNull(menuCategory2.getItems());
	}

	@Test
	public void testReadPizzaMenu() throws IOException {
		File f = new File(MenuDeserializerTest.class.getResource(
				"/test-menus/pizza.json").getFile());
		System.out.println(FileUtils.readFileToString(f));
		Menu menu = fixture.readJSON(f);
		assertNotNull(menu);
		assertEquals("PIZZA", menu.getCuisine());
		assertNotNull(menu.getCategories());
		assertEquals(2, menu.getCategories().size());
		//////////////////////////////////////////////
		MenuCategory menuCategory0 = menu.getCategories().get(0);
		assertEquals("GARLIC AND OIL", menuCategory0.getName());
		assertNotNull(menuCategory0.getItems());
		assertEquals(1, menuCategory0.getItems().size());
		PizzaMenuItem item = (PizzaMenuItem) menuCategory0.getItems().get(0);
		assertEquals("BIG", item.getSize());
		assertEquals(StuffedEdgeType.BOARDERLESS_FILLED, item.getStuffedEdge());
		assertFalse(item.isSelected());
		assertEquals(2, item.getIngredients().size());
		assertEquals(PizzaIngredientLevel.LEFT,
				item.getIngredients().get(PizzaIngredient.GARLIC));
		assertEquals(PizzaIngredientLevel.ALL,
				item.getIngredients().get(PizzaIngredient.BACON));
		//////////////////////////////////////////////
		MenuCategory menuCategory1 = menu.getCategories().get(1);
		assertEquals("PEPPERONI", menuCategory1.getName());
		assertNotNull(menuCategory1.getItems());
		assertEquals(1, menuCategory1.getItems().size());
		item = (PizzaMenuItem) menuCategory1.getItems().get(0);
		assertEquals("AVG", item.getSize());
		assertEquals(StuffedEdgeType.COTTAGE_CHEESE, item.getStuffedEdge());
		assertFalse(item.isSelected());
		assertEquals(3, item.getIngredients().size());
		assertNull(item.getIngredients().get(PizzaIngredient.GARLIC));
		assertEquals(PizzaIngredientLevel.RIGHT,
				item.getIngredients().get(PizzaIngredient.BACON));
		assertEquals(PizzaIngredientLevel.LEFT,
				item.getIngredients().get(PizzaIngredient.ANCHIOVES));
	}
}
