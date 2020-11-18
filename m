Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873B2B7FC4
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 18 Nov 2020 15:48:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kfOlK-0002qT-7R
	for lists+kgdb-bugreport@lfdr.de; Wed, 18 Nov 2020 14:48:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ito-yuichi@fujitsu.com>) id 1kfMIK-00034J-77
 for kgdb-bugreport@lists.sourceforge.net; Wed, 18 Nov 2020 12:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y3MBA/LtBUazcmZ/SVNZliYMu8/G8VP7mqlWhVB6P+U=; b=WVhrXM9z64A5lgybwynWcT+Okf
 5qpRSGAWWJhShDvA7517ckfMqV0DvqxoLpmgkro10Gr6hXw+oR7P3iY4XaIktWQShPhCJNyfG8UnT
 +ai2kC8uWB15LFVPOaRi1Om85lyostAR/HedVcoyEFkJiDYayv5mlKwndspjWC7Wj0Io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y3MBA/LtBUazcmZ/SVNZliYMu8/G8VP7mqlWhVB6P+U=; b=Bbgwycfy0lMOgclNzuyMtyqjyS
 c4TcR95BPQJsZe2VSd60gBSbqlBOFJ3tnwYt7D4H7cUC9BOyZJbBYgjxRukYxkZuMZPEBdihcfUtk
 rqGHYMZ6mFQtTd2gAWqbztWOkJjlYpHOUadSjvVEYPO3BqTbeQ92r8A3zjqCuZV/pEl8=;
Received: from esa8.fujitsucc.c3s2.iphmx.com ([68.232.159.88])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfMI4-003dkW-8Z
 for kgdb-bugreport@lists.sourceforge.net; Wed, 18 Nov 2020 12:10:37 +0000
IronPort-SDR: 43crEYb5mqIFISCDv7HBeKgtjQWL6bPVliEQVFOgRniUtdk5fFr6l5ZJ8r81SR5jYO6Q9xXka8
 lVlVtjTjo3shfmTvXw5oiFUFAZtNEIX3E4n5SHlJNWUmSktpkYuJjVQ0LpeI45RgojgZi6eE94
 lhT0+KClL+b1Ih31duhpQSWUjOKmZI/LnRw0QMHSmgCJib2+/t87tR7f4K1m2AzSw00tv9HdOY
 xWyY7NMzUxcFgEM4dVS7ucDFqP76YcgdQwFwG/r/PaJq2sW9IJVSsZA43fGq8XPSIi5mxZO3dg
 O7A=
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="21472048"
X-IronPort-AV: E=Sophos;i="5.77,486,1596466800"; d="scan'208";a="21472048"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 20:54:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnVdeVk+TBqOaW8DzEP2t/x6JE1phV5KFAQy0jn+sKRo6zTxm4SLVaD4nqDNkAWch2BcVJT02TpnSauozwgOsTQEt0Q653gVuaUHnIdr/aEGkTMV43dwFbJJ6z1qMs3Gro95CxRwGMSNdzoWTirU3v44ruJE2ntQiPj07m2/ibWvHBwvkV0QgCVkPKkM7v09ObtCY4txYfYKdgOKgWf0oLyMNwKyhQyJkLueLYmWUgwWD2s7TvYe72KffUIwpQOUEkoFSVa6FDYNJmKL1LCAk9qT4zpNVqdK0kM2IgxXALps1w4KINght91rBc6dRMGIrRTdgU/ZvhzeXtcylgNQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3MBA/LtBUazcmZ/SVNZliYMu8/G8VP7mqlWhVB6P+U=;
 b=Sav54r1SjHAkuHnBPDw+xRZwkgs9yPWPVUSaT5TBGPLcAMvb3lksMrSjSL32O4FXzeXl2AZGg7CQ/sSrMfpGw5G58cMyGRW0mrfqr1qCfTSpp709M0MxjyfKb5B28Ywo/KK+OBODUQJsjdUONpr8ZjxJASSw/76eVj/TUUaBoywO3C5LxGZh65qCE/u0Zx6fiV+sHaQW5kCkpe+3/xqgGvsuETwivmrfYJKRUd+w3m8mWW0U2tqpWJCzESIe5SekSmbDX0QW9Tyt/4aWC/ZBjiEYZtYs5r7honeeGWieUgRVu1DJcNgnph/OZNae7aCsFfmsdvTHs45dbbF5Lpn9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3MBA/LtBUazcmZ/SVNZliYMu8/G8VP7mqlWhVB6P+U=;
 b=KFH3m9H4MD+iXPFBw0E5grTK7P+MESxKTTN/yW1lR/d52nLM8I/vCYxrkYmXa8mJcIHMKF41JAGiXIpBNUv7vNFJPLw4RcrjCkgF1+c8w7dQyuQIdz5mLsZnnLO6Zh3J046DSt8kixMBJGdduraT3qWlvVU+KdeJ4uFYzDOkFkY=
Received: from OSAPR01MB4227.jpnprd01.prod.outlook.com (2603:1096:604:58::11)
 by OSBPR01MB4230.jpnprd01.prod.outlook.com (2603:1096:604:47::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 11:54:09 +0000
Received: from OSAPR01MB4227.jpnprd01.prod.outlook.com
 ([fe80::d122:64be:9d6c:c04b]) by OSAPR01MB4227.jpnprd01.prod.outlook.com
 ([fe80::d122:64be:9d6c:c04b%6]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 11:54:09 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: 'Sumit Garg' <sumit.garg@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
Thread-Topic: [PATCH v7 2/7] irqchip/gic-v3: Enable support for SGIs to act as
 NMIs
Thread-Index: AQHWsQ3EhjITrE0OvkCuaDLAUQx4dKnN3SoQ
Date: Wed, 18 Nov 2020 11:54:09 +0000
Message-ID: <OSAPR01MB4227CBF50049454E627A948F8FE10@OSAPR01MB4227.jpnprd01.prod.outlook.com>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-3-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1604317487-14543-3-git-send-email-sumit.garg@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd760e0c-c140-4f12-dac7-08d88bb8a8f6
x-ms-traffictypediagnostic: OSBPR01MB4230:
x-microsoft-antispam-prvs: <OSBPR01MB42306558F5A75FB117677BDC8FE10@OSBPR01MB4230.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cyYfrPJQQAzVWxtSZg6xqb6nD30ki1BtKL0VdMvnkGvYlbAE0Xb8//DMTmRBBE+MwM9q8zDj5CTFH2eJ7nF1q/GnTr2K3Jmkf6CMmKm0fN6fvODpdjfqtsx96kWtk5D7Pj/Q5ETI38Ofrr45F0XwZ3f8uFgZ4zKocMJDRvkIVaGgY2zwZdtxaY/CsdkeqHMFhIk+BL2PHcO1GU45/tp80SZ8NLZIBdMNgmyShNbr9cx5rv3yIhf7TpncZx0te22+w9Gr+zL1WLd6xehwbjjHDQq8iSLfdSJEG7FcKiQd2BTllEh5tW1N6UyH3FgE5CRegpm1wk1xNGk/8+yh7XR7Ra9ZOZkPH23I9HBLNJynZanYqw/8grDQvuyhT+wOqFRV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB4227.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(52536014)(86362001)(7696005)(478600001)(8676002)(9686003)(5660300002)(83380400001)(6506007)(26005)(71200400001)(4326008)(66556008)(66476007)(66446008)(66946007)(64756008)(76116006)(33656002)(7416002)(186003)(85182001)(55016002)(54906003)(8936002)(316002)(110136005)(2906002)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wd+ycRRCtU3Yhpn4u5bXAZiipn+br8bGJmGNghkc8xEkqT4su4uvqKhuzO1bt2z/eW0HEH5l90R1YwyIWC4p9Lhiu2zSN4rEY5VZrGrMVDh45UAuCgav1TvbGOl0mYkf7FaQVsbRhEFNkPIvpayemiS1B6VJrkUo+SdUKd5AdQ3qkRud2uRfUH6+T/51Ld3bFgYYWa86TMumsE9wCbbyq8EM6UEtnTLxLgL5TCqRssYjr13+sWvq0UZ8nAz+0qvyCWhXUM2dtUqUAJlNX65bDDPVaTVm1abSLNAnKLLRQvXCOTXK+AqpXtbZTPJQlMeztqsMWUQP5tmDmBhWrIX9Ymytg/pWbIaRgCqkDgvq0x0THpt066Uz7obWh/keFuiTok3Cq23p7dgl+dStbg0lv+2QXPn3KscRM+s86H2NuiSLuelo5gaVG0Gx+Gf3SdT4vQLJR6q9y/ZsEjhr1RW48IZkxsXb3QB7HA3Res5Xij4fSQ+baPcCufEnlL1anhDx4VpcKwcnP8p+IDSgnabKltVdQIUoejcm1fHYSUPKMouk0F0lVbarRrEPDkJd5Mmq67UxfFr3dgrUXc75hBTib6U0RU0iuNZ+HaaohA4WoilrwneoBHeziKgB45ijo+altqsJ84gmBF/D9Yuz7aZ9kBccy10m0lOdMjhO6y4snT2Jub6co2e/IeXLXFeF2yeKg2Sp1ip/IbYArMwbYhFavP1Mfb5BgliVk3dOleO0kkjgto2D4385fN0w4ASvlhRoAPQqjfR/z+kU8IN55kk6J4J4UFYyv3LAcjHf2nhgb0E6H7vs/nKGlzChcL7BG+tIfZ79XPUFv+BPeJUEiWHBqcj01niMnTU1uC5aLCU6rim+3s3X/9gcq20QMWm8oFmwSVWLLhsD0k6iAnMpJ2AzcQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4227.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd760e0c-c140-4f12-dac7-08d88bb8a8f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 11:54:09.6779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekpBGCUyuWU/Mo0B8c23EOMzJuSKRP5vLW/v6Nyhz4Qzg9r0qvOLytTNGEygWxlDQp1bBOx8GoGCjSZSkUX4gjQ6o7ZLAv/y88mQdW9ttuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4230
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [68.232.159.88 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [68.232.159.88 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kfMI4-003dkW-8Z
X-Mailman-Approved-At: Wed, 18 Nov 2020 14:48:44 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v7 2/7] irqchip/gic-v3: Enable support
 for SGIs to act as NMIs
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "julien.thierry.kdev@gmail.com" <julien.thierry.kdev@gmail.com>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "msys.mizuma@gmail.com" <msys.mizuma@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sumit,

> Subject: [PATCH v7 2/7] irqchip/gic-v3: Enable support for SGIs to act as
> NMIs
> 
> Add support to handle SGIs as pseudo NMIs. As SGIs or IPIs default to a
> special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI handler
> update in case of SGIs.
> 
> Also, enable NMI support prior to gic_smp_init() as allocation of SGIs as
> IRQs/NMIs happen as part of this routine.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/irqchip/irq-gic-v3.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c index
> 16fecc0..7010ae2 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -461,6 +461,7 @@ static u32 gic_get_ppi_index(struct irq_data *d)
> static int gic_irq_nmi_setup(struct irq_data *d)  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
> +	u32 idx;
> 
>  	if (!gic_supports_nmi())
>  		return -EINVAL;
> @@ -478,16 +479,22 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  		return -EINVAL;
> 
>  	/* desc lock should already be held */
> -	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +	switch (get_intid_range(d)) {
> +	case SGI_RANGE:
> +		break;
> +	case PPI_RANGE:
> +	case EPPI_RANGE:
> +		idx = gic_get_ppi_index(d);
> 
>  		/* Setting up PPI as NMI, only switch handler for first NMI */
>  		if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
>  			refcount_set(&ppi_nmi_refs[idx], 1);
>  			desc->handle_irq =
> handle_percpu_devid_fasteoi_nmi;
>  		}
> -	} else {
> +		break;
> +	default:
>  		desc->handle_irq = handle_fasteoi_nmi;
> +		break;
>  	}
> 
>  	gic_irq_set_prio(d, GICD_INT_NMI_PRI); @@ -498,6 +505,7 @@
> static int gic_irq_nmi_setup(struct irq_data *d)  static void
> gic_irq_nmi_teardown(struct irq_data *d)  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
> +	u32 idx;
> 
>  	if (WARN_ON(!gic_supports_nmi()))
>  		return;
> @@ -515,14 +523,20 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  		return;
> 
>  	/* desc lock should already be held */
> -	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +	switch (get_intid_range(d)) {
> +	case SGI_RANGE:
> +		break;
> +	case PPI_RANGE:
> +	case EPPI_RANGE:
> +		idx = gic_get_ppi_index(d);
> 
>  		/* Tearing down NMI, only switch handler for last NMI */
>  		if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
>  			desc->handle_irq = handle_percpu_devid_irq;
> -	} else {
> +		break;
> +	default:
>  		desc->handle_irq = handle_fasteoi_irq;
> +		break;
>  	}
> 
>  	gic_irq_set_prio(d, GICD_INT_DEF_PRI); @@ -1708,6 +1722,7 @@
> static int __init gic_init_bases(void __iomem *dist_base,
> 
>  	gic_dist_init();
>  	gic_cpu_init();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
> 
> @@ -1719,8 +1734,6 @@ static int __init gic_init_bases(void __iomem
> *dist_base,
>  			gicv2m_init(handle, gic_data.domain);
>  	}
> 
> -	gic_enable_nmi_support();
> -
>  	return 0;
> 
>  out_free:
> --
> 2.7.4

I checked for this patch and I think that's good.
I've tested this patch with FX1000 used my other patches.
The result is as follows.

$ echo 1 > /proc/sys/kernel/panic_on_rcu_stal
$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
   : kernel panics and crash kernel boot
   : makedumpfile saves the system state at HARDLOCKUP in vmcore.

crash utility:
 #7 [fffffe0029e4fd30] lkdtm_HARDLOCKUP at fffffe0010856eec
 #8 [fffffe0029e4fd40] direct_entry at fffffe0010856c94
 #9 [fffffe0029e4fd90] full_proxy_write at fffffe001055ced0
#10 [fffffe0029e4fdd0] vfs_write at fffffe001047436c
#11 [fffffe0029e4fe10] ksys_write at fffffe001047466c
#12 [fffffe0029e4fe60] __arm64_sys_write at fffffe0010474718
#13 [fffffe0029e4fe70] do_el0_svc at fffffe00101590cc
#14 [fffffe0029e4fea0] el0_svc at fffffe0010147a30
#15 [fffffe0029e4feb0] el0_sync_handler at fffffe001014835c
#16 [fffffe0029e4fff0] el0_sync at fffffe0010142c14

Best regards,

Yuichi Ito


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
