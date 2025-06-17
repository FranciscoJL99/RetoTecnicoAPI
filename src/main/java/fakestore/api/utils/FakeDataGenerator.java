package fakestore.api.utils;

import net.datafaker.Faker;

public class FakeDataGenerator {
    private static final Faker faker = new Faker();

    public static String randomEmail() {
        return faker.internet().emailAddress();
    }

    public static String randomUsername() {
        return faker.name().username();
    }

    public static String randomPassword() {
        return faker.internet().password(8, 16, true, true, true);
    }
}