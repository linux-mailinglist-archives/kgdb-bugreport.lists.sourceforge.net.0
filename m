Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0A218885
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 Jul 2020 15:09:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jt9p0-0000dy-AV
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 Jul 2020 13:09:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <james.qian.wang@arm.com>) id 1jt4My-0003tf-8G
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 Jul 2020 07:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=; b=bQ04QWQqHV1yVSXIkHLgH+fLV6
 EUIeXPmShNMzwGKHnOCBBd777yHiUEvMQ/SWmg3lf4owklferVJ2ATceMXnPCbCdBDpm7usuL98Co
 IGr14s1Tk8MsB3uTIEbhWPT/Boil1dyyWa+TzR5ekJmnTtaSTD/jQEUF0SRd/bb+xqV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=; b=bsbehUKZfANXGzr2YcGfw9Rasp
 RRsDbvGzzQaUyaB2PCz375XWhUknR9BlqR2Awfuuy03BZzHm0PqiPjOJEAgZFYvjjsODGtEuGBBa+
 RbzeyLh1vqttbM7kZ1hupXM9Qs+sEsirhp3S4pgOVWmjrum7or/YkdHLSE8tnf6W3wOk=;
Received: from mail-eopbgr80053.outbound.protection.outlook.com ([40.107.8.53]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jt4Mu-00Dwq8-Mw
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 Jul 2020 07:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=Z7NBqvep5KuQYSyH/wF3oHrHsHWaGhtoxTqVWcgqbmGVKlYftZxS+XAXeC+uHJyf/GjIMC8YdPd8VKTP/EzNmsV3qZzE9od25fFWW5t3xf6jRZBhikORdvNAsixWI/oqWI7xRWRgSrBcw+WLArC40UdFIMS3XFuQMchUVWmD2NQ=
Received: from DB7PR05CA0040.eurprd05.prod.outlook.com (2603:10a6:10:2e::17)
 by DB7PR08MB3867.eurprd08.prod.outlook.com (2603:10a6:10:7f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 07:19:41 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::32) by DB7PR05CA0040.outlook.office365.com
 (2603:10a6:10:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Wed, 8 Jul 2020 07:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.sourceforge.net; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.sourceforge.net;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Wed, 8 Jul 2020 07:19:40 +0000
Received: ("Tessian outbound 4e683f4039d5:v62");
 Wed, 08 Jul 2020 07:19:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84719459c5a0d449
X-CR-MTA-TID: 64aa7808
Received: from 0c7ca0ba8389.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16C0E0C3-FCEE-4BFB-A29B-575CDE561425.1; 
 Wed, 08 Jul 2020 07:19:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c7ca0ba8389.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 07:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXAJnuftCYN4eLG7y5MpPp7K77lHN5T9Fw6SesFCbuQeHzG6lPzgLMMTJA1Uer1cNKd8stOHFjRaMQzurDgVJwBB6uz/iUVJHoIeZTlcWuIgE27PmZtqJ53iy1KWZZHUbRF8PeF0ntkHOIw0ol1TgwenNheXxc0FQNM2n7BbJanjvbDJCoxqheIqDMg8BPVcK00TskgbeVESEgmZVn3kIQ/1sdzxZaDy4HpPiwBpENOGdlUC5q070kSBvJ4qGsQE/taMe9MThyGV+r6Tx6GB3QvbRUNsXxGkZuoKUnr0EsGsUwdzMev+UpP5Edn4nNfzsDO01XVdyQ9U3whG8pgD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=bs8ObSbhVbu7ggwdmxh99Y4u/sMnXIGUjDjCgKcymNH+HAciicG7OE8oRQ65d3n4dZ4oYPXvqSaEEwsMdg/vpGKYlbl+802VIQDw8Sjym4Fq3cGS2JFb8MyDU9zjmzJBopxMnqajf0HDVCoGkRBreOOUpCZKBp/hTZsrAA4TGKQr3o9OE+sOEMK1pwkO/YjGNaPwl3WymSUpT88PqaCo90jCJgiYwWtAVY6nu2nVEQWpMfG39p54l/6Fl4NP9MlYvy7A49NiKwvoahSs1QcszhnJmt8zh34BEo1NB+7qLf0htnTdhPcFDY885OfCjERjvbRYdz7ncxg68qM9cyeemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=Z7NBqvep5KuQYSyH/wF3oHrHsHWaGhtoxTqVWcgqbmGVKlYftZxS+XAXeC+uHJyf/GjIMC8YdPd8VKTP/EzNmsV3qZzE9od25fFWW5t3xf6jRZBhikORdvNAsixWI/oqWI7xRWRgSrBcw+WLArC40UdFIMS3XFuQMchUVWmD2NQ=
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB7PR08MB3866.eurprd08.prod.outlook.com (2603:10a6:10:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 8 Jul
 2020 07:19:30 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 07:19:30 +0000
Date: Wed, 8 Jul 2020 15:19:23 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200708071923.GA1127463@jamwan02-TSP300>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-7-rdunlap@infradead.org>
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.111) by
 SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 07:19:28 +0000
X-Originating-IP: [203.126.0.111]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e4c0cc8-8b44-4063-2e40-08d8230f47bf
X-MS-TrafficTypeDiagnostic: DB7PR08MB3866:|DB7PR08MB3867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB386739D80F451BC9880A5A10B3670@DB7PR08MB3867.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JMs8wCULxbtOsZOmUQzPrITahAzA4Io1/sdAjlgr8dJE3tHGP4GIeV1X4Vu2A7mx3XJFaxhGWIAT5hTG1FIKW3Ym1sxFbUxGh/7QSkykaRbClm+o7OVpeLyz4aYhx4XrqZx4wyUwOHXo1ewT5xq90DhW7ct8taT+VYtTEALZwnewyH/xUXEkZ54b7tx2dTbgmb3ihzt5xLhaa5Q3NACOdz+Nv0dTpfE3/fpA6xlFigyk5kmoRFefn5yPa7Qx2ssEHwDHqMaf4yNnDsLZu5g/qY8pi/c2exhw/X2uf0UqNx2y0qzMBjuc67vFvDR6qld6Efymt7VhzVK+9K17nyxvgw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(8936002)(478600001)(956004)(54906003)(7366002)(86362001)(7406005)(9686003)(8676002)(316002)(7416002)(6486002)(2906002)(33716001)(6666004)(6916009)(1076003)(66476007)(66556008)(4326008)(66946007)(33656002)(83380400001)(186003)(16526019)(26005)(52116002)(6496006)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: s28MBsKsTNwLsb9W726e+etxqE/6znWCOOivA0sQnLqpMN6EqMSmrM6eEwj1qUVHukQiovpM6XzazVXZiSwSO9vVVgp1ps+hDhPnHxKC4Kb6paqlRLn5HNV0StemiVHmy4Ze5RLtH1yUVS5S0CPqXUnn0BQE2rrAjC0IOnPB9b/BteSh/zzB07567K+zDHCOXeSNv6L1XsQIznCLeLdxarRLq2GZ0W9dyGB4X6XZNrp26pn0U8Z5rM8uU1PhfmpcjwEaLFqiUzxwmdKOUDEqsIMuqY0H4db3enXR4Dhc38e6nJINBTEZlyTTZ0BcqpJKu0343xm65IQyoqlnecLBU7djtFNMW4L8EqqAA43UZZVM0mbg+S+zXUS2I/rxeXEqaS3jIga2A3pbxP4oXHelCX0cgHrAxNhSIJMTpH4thNLJx1P47VYKAZDftLdV1VUYP/XzobqEsn4ahCCW8xGiiixtnG5s3m48t/KIOe7xtDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3866
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(39850400004)(376002)(346002)(396003)(136003)(46966005)(8676002)(4326008)(47076004)(86362001)(82740400003)(6666004)(1076003)(5660300002)(83380400001)(81166007)(82310400002)(356005)(33656002)(6486002)(9686003)(6496006)(26005)(16526019)(33716001)(2906002)(186003)(478600001)(956004)(8936002)(316002)(70206006)(54906003)(336012)(6862004)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c801bed8-98ca-4271-cf60-08d8230f40e3
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbjvHVpaFxG89SsWGIppFcTcvxUeWNxVFF5IKJMwtEe5AXqxhFXbz0/HaC+Z0fUFW6SZcZ3A+82vPFjjab+lWl3rXIamuBHhFiTTYcIgW81T9BaHAI1fHgcdFsLVJPo16WiIZF3vdAkE1kO9pMgblAU07EXb0e9UDdrmCJUylI12r4zpWRofCKZDELZ5t8BYuApNUS6E5q7VUN5kSJmP9q/DP+btKA+GYyvQ3oJDdt7mbsz49O1v75+dETsWHeg0GBfC9qcFdsIFsZAAwp6lIbgvpFfEMz8M7ZeUZs29CWvUVnaRDI3qnRaO7h8GHGQYw8Eyf7M/IEw7TVtC7GuP+cECfL7IuekjpJx3Zeth0WUjZv76ISYidFdf++0OlWRq6OUM6bBDry0lkt88OKDB0g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 07:19:40.8048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4c0cc8-8b44-4063-2e40-08d8230f47bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3867
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arm.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.8.53 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt4Mu-00Dwq8-Mw
X-Mailman-Approved-At: Wed, 08 Jul 2020 13:09:06 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 06/20] Documentation: gpu/komeda-kms:
 eliminate duplicated word
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kgdb-bugreport@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-input@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, nd@arm.com,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> Drop the doubled word "and".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: James (Qian) Wang <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> ---
>  Documentation/gpu/komeda-kms.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
>  frame. its output frame can be fed into post image processor for showing it on
>  the monitor or fed into wb_layer and written to memory at the same time.
>  user can also insert a scaler between compositor and wb_layer to down scale
> -the display frame first and and then write to memory.
> +the display frame first and then write to memory.
>

Thank you Randy

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  Writeback Layer (wb_layer)
>  --------------------------


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
