
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geographr <img src='man/figures/logo.png' align="right" height="150" /></a>

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

## Overview

geographr is an R package for mapping UK geographies.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("britishredcrosssociety/geographr")
```

## Health geography

### Integrated Care Systems

Originally coined sustainability and transformation plan (STP), then
accountable care systems in 2017, they were renamed in February 2018 to
[Integrated Care
Systems](https://www.england.nhs.uk/integratedcare/integrated-care-systems/)
(ICS). They cover the whole of England and form part of the [NHS Long
Term Plan](https://en.wikipedia.org/wiki/NHS_Long_Term_Plan). In an ICS,
NHS organisations, in partnership with local councils and others, take
collective responsibility for managing resources, delivering NHS care,
and improving the health of the population they serve. ICS are supposed
to be bring together NHS trusts, Clinical Commissioning Groups and local
authorities.

### Clnical Comission Groups

Replacement for PCT’s. They work with patients and healthcare
professionals and in partnership with local communities and local
authorities. The aim of this is to give GPs and other clinicians the
power to influence commissioning decisions for their patients. CCGs are
groups of general practices (GPs) which come together in each area to
commission the best services for their patients and population. CCGs are
responsible for about 60% of the NHS budget, they commission most
secondary care services.

### Primary Care Networks

Introduce in January 2019. They provide the opportunity for GP practices
to join networks, each with between 30,000 and 50,000 patients. The
stated aim is to create fully integrated community-based health
services. Most networks are geographically based and, between them,
cover all practices within a clinical commissioning group (CCG)
boundary. There are some exceptions where there were already
well-functioning networks that are not entirely geographically based.
Some networks cross CCG boundaries.

### NHS Trusts

An NHS trust is an organisational unit within the National Health
Service in England and Wales, generally serving either a geographical
area or a specialised function (such as an ambulance service). As of
April 2020 there are altogether 217 trusts.

### Primary Care Trusts

Primary care trusts (PCTs) were part of the National Health Service in
England from 2001 to 2013. They were abolished on 31 March 2013 as part
of the Health and Social Care Act 2012, with their work taken over by
clinical commissioning groups.

### Health Boards

To be added.

## Resources:

-   [A Beginner’s Guide to UK
    Geography](https://ago-item-storage.s3.us-east-1.amazonaws.com/86ebfbad61c941bebbc7edbf2b985efe/A_Beginners_Guide_to_UK_Geography_%282020%29_v1.0.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDePLKKcoYp%2F%2B6gHqdY0UOE0iitTLZIic46rd6HNLFj%2BgIhAM%2FPmaYOksAyoE9nxGS%2BavQk7VcATCuMok7jtuzoJIlVKr0DCMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjA0NzU4MTAyNjY1Igx%2F4kGXt6IKHOzH0scqkQNrPfE1IRfsZ4mPusOlaJ%2BXyYxsPjchwMd7fDDnsfQ4SVcEHN4bWYzZR54NmjGSI%2BBrns%2BPsSIFMXAKnZMEnsD7j6Gu1aCOW7G0EYnGjcvXWPahl4UwrUcfc9vTsycPPEUmbpt8kVC6YugX7OtgsgXwp5X%2BEo50BbMhuDSLyJHGelYxXlTOdbiZrZ61ziDkL4%2BrvOpOd7G2g6oOjh1QRit15ZjcBnReeEhN55c35cK05qXa%2ButlRamqDrKfgW9SF9kZ8G3g0Bl6Z2YoPJwK4ryHIW5DcOS%2Bzid%2FGpFw%2FD1G4Px1BpPblug8OJ0dxGnzIfqhXOKWpNShTjUMlIvAPzPHedKrnx0t3Eo3yhgWHwwy4bJuX1eaoSv1D8%2FodMvGJVdrEE7I0SNIHwcmbvD6I%2BMScXCBLr3T%2BkycFx7QyIoIgm81YI1XJjaMmwQqfMje8f%2Blvh9hY2a%2BjiI0nG55Qd4jpC3jq5VmTpRW8r7oq7zRsIoa99OKQPAa8LyexmqiDYsZBl1AN6ouett1Nnfajr1YjjCAqOCABjrqARwl14wNOvA7oEfBiZnIlImd%2FluOw242VlVCjqVahE1OH%2FPVp7n%2BMtFeeW4gM1VcaM7N3MUZCCXqAWMywKTa2hvoXt2UCOFfHC9aT%2BpoCwuQAt4V9pV1yW%2B5r6QYZcCWUjhs3kJvT5Kcf6%2Fsie1TBCBPolwm8bQ4526JWyLN2sxXI9rrSMDotJt1sgkV6xC6%2F2O3imWcteLsWXOLG%2BoBI38i4xHs2mRS9%2F%2BHHNA8EpXlxBXgrQoHADW0DCLOHNNPx8bULTVBXB9EdewoD9Ws0e1qHLo8bJMAEj83U%2BpgMLeZSuW4OEIRY%2FKaqw%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20210201T162450Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAYZTTEKKEWJADVX4Z%2F20210201%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9870cddc8ff4f3e2e1cc10802e079b2c2548334659b33f03853aa33ec061b8db)

-   [Hierarchical Representation of UK Statistical
    Geographies](https://ago-item-storage.s3.us-east-1.amazonaws.com/c2eb89ab698144bf825873c1ae161c06/hierarchy_poster_v2.9_DEC_2020_A3.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQDAL%2FT0GCi8M4ch%2BKZhePRnEqg570td%2Bq1%2BQsHm8Bk7rAIgEODOCg%2BzG5NNDM7ttvYHkglQ1api0q8DzOwn5C8fkfYqvQMIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2MDQ3NTgxMDI2NjUiDPWhmGDGAtKVDrhj%2FyqRA5wSnsEpPXSefA2SiRZPp5VEuQrmBVwkNk4cC1GTQPB%2Fq904en17D%2FwdbD6ULn06InAt%2FNfTlvwL%2FfOiWM%2FLtueChurCHq3uqBk0sb2fuiCx8WTvyC76xdYweNf%2FrbKZXxp7R35hO6aSBpuOXm5iJjdp4jZOcjoJ2C2TbZwJai8t3QRvZpMpmlP6mX%2BaMpYbrGfPeq1TJRUW7jiYysBwiPgrGnyuIOyt15aYC2mAslP%2B3kZQLDVNTXBILjVNaexwa3LvC2uzGyrwN51l2AgOAvvVDIhWNsoJiuJFCdBHdRAUzqfwHNCLW2nQMH34mJN%2FqqHBk5tfD%2FAB2NJa4g9KpayhmMeLnXN4%2BMFSlSjHiCHTtrex%2FO7u829LwU%2BQaxDQRCfxDIKdmYoNSeNPT3gGd34GDEgjdqw0d7dBOYCn6gAgo2saeQgxbsnS7xOmXWCtUAmiLyW%2FIdSgcmibrlvhEyDWDz5Hk3JazEQumZYuRMw7hObULpFu1NNfS%2B1%2B315jCvgxExQnJ2aVyCKhI1pVfjzUMLfN4IAGOusBxtOpXGw%2B1CtcsIqGS45TxYfJWp32Z%2BxcyrIWHVpP%2BkP%2F7nFnPI3Pqdz5mxUNZOFPH7h1nJr%2BJEp0ozKozoTdldI9rvkx4B1UmQB99gWpPREaKD44FqFQO58lSl%2BT8IK67fAy1WTT3Qm6avFEV0fkO%2Fx0aOjXIVdR%2F3h4P39f%2Fe13JvTd%2FJPv8YSTOb9HD0NfkYNZaupjWA0jSN86M9qWfSkTBqHW%2B0iWJgHH%2BC3HyAoUL%2FgDdDE4thaEGvYAWY8H4lKPWGQ3%2B3j84nzqibA%2Fz%2FO4JWt8oqNC9Qo30NEeQ6BUtQxlaB66%2Fz6Wqw%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20210201T163018Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAYZTTEKKETT2RHOPR%2F20210201%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8e0897a4597f0d29ee589a6316b1070fd414a7d31ddb2cca1855bf915fd5e7b5):

<img src='man/figures/hierarchy-poster.png' align="centre"/>

## Contributing

To contribute to this project, please follow [GitHub
Flow](https://guides.github.com/introduction/flow/) when submitting
changes.

> Please note that this project is released with a Contributor Code of
> Conduct. By participating in this project you agree to abide by its
> terms.

## Credits

Developed by [Mike Page](https://github.com/MikeJohnPage) and [Matt
Thomas](https://twitter.com/matthewgthomas) at the British Red Cross.

[Contains public sector information licensed under the Open Government
Licence
v3.0.](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
