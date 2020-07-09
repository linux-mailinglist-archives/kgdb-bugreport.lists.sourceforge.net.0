Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C6219E8F
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 Jul 2020 13:01:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jtUIq-0000ak-7j
	for lists+kgdb-bugreport@lfdr.de; Thu, 09 Jul 2020 11:01:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hao.wu@intel.com>) id 1jtQ51-0002jZ-QS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 Jul 2020 06:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/H8Sgc4MMobIlv4RQ3icoUi+h/rlKK4LSDg79C9pE0=; b=KoEREuoXWv3jh/8KWBi2t1C8NH
 ZnrZ+fJhjxwJwPe5oTRYvnj8AQcYFD7h2J4n7nTtPsmlNljGFxTAPNDNxs/ERmXT5XDUmkATV61oW
 RmWDhX1AvjPAT9eqsJ0DgpZ+HlNDv5srgG8rQBXbZGJ7lnq6b1XTAwpldhaq5NpuUEAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t/H8Sgc4MMobIlv4RQ3icoUi+h/rlKK4LSDg79C9pE0=; b=alyHMzqilBkkVDwnhjV5wv76xW
 cbYqMSq7rKkI5j+nQRT4yx5LLyFzASyqi/ngyd/jocrtx+CIJED3EJMlrTc1j8YZOrRD4eJo6n13Y
 4vBWdmQeVpvW8AcVOzmn9ZkTE7dI4pg0EmY7STTZwONa1GRUE9DdtH4kw+6ZsLunUH+c=;
Received: from mga18.intel.com ([134.134.136.126])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtQ4x-00EpTe-B2
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 Jul 2020 06:30:47 +0000
IronPort-SDR: GW5q3P4JSOEE9KbZfNlz3/6l2wA4qiov0z3Ns8vnSlb7lDJU+UcmlltR3LokN6F6328pLgJlMR
 a3WAL794o4dA==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="135400730"
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="135400730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 23:30:37 -0700
IronPort-SDR: fd+xd7pNKpQFW51UL1k7PO+0KbxsMPtAVVY6SG8YdnWYDUMt/yehfz276pXVdKHwBiVOoWocHY
 ro+hVNgKuwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="323148287"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2020 23:30:36 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Jul 2020 23:30:36 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Jul 2020 23:30:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 8 Jul 2020 23:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SN3VibjvDDGQ0140HefRhJAlzrQ9dYAQv39DTb6Q3preXyBUp9qqbFuQ7Jb/aJ1+OWb2qd668cxoZoNV8yYbRszq6Z+HuSGXC+r9f5UT12s31wIlccOPdGR7pcexQpH1kMegGeJ29XSCwhRLb19e0YLKIXwHZ9xe0EStmjogt4129m1axXMiCJKZ8yPYhIpxgw434B1xEt4jxAjM4L8Nm1fdO3QPo0l/T+vUGwWtiLSfSGlxPeczuyR59buvCQFQ5GoLVW9siX06ruFg4dhuY70kkDKDUGiXgl+/rNX/Wxkh7ilwIAmIDLikhyPu2lHbDwa10Jcs6C0T8PxUobT2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/H8Sgc4MMobIlv4RQ3icoUi+h/rlKK4LSDg79C9pE0=;
 b=DV46YXwtfn7Sk6iUQUGZDTIBQ42/sTzE2IeRczywn778weSGqKuNgoeKXfs/vKMHq0QNm5WyloGFQ9jBNf5jW5VzDGwm/uHy0rtEz6pRfixU1RucRR7+ennaSx4+OSN1MfR4L8SCa7Jg0MhtfNu/C2cz7bivEsaQcT/lNPvx6TH1Fpn5gXXRaZAAXqPKb4g9kM4rmy3T35RUBIjxjXedfWb19I1fCS9Qapy5Csqa6HE0OkJ3rwZeiZdariHzKA2ABw67lG96rkcPWbIaLBGIMQmInthoGwx2E5ZZymOnoNdXFwFCaBMdcpY5kZZc1Jicw49ghcQyVvo4r6if030gKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/H8Sgc4MMobIlv4RQ3icoUi+h/rlKK4LSDg79C9pE0=;
 b=r44G/c0teybHmOaJV4L1yTv30Gq0NRMfmyPRJTUX65pqRedz3zMGnEDzgvnl+g8zYAG1GeKV8gQMpStm+BIJbvjbhE0jQl7uw4j9qJ2uYjBmBy71hcXY+709voPmphjuiZKSAamcIHuLyALqaBVM+97WTj8ecO4JNHIzWg+Yc3Q=
Received: from DM6PR11MB3819.namprd11.prod.outlook.com (20.178.231.223) by
 DM6PR11MB3913.namprd11.prod.outlook.com (20.176.125.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Thu, 9 Jul 2020 06:30:34 +0000
Received: from DM6PR11MB3819.namprd11.prod.outlook.com
 ([fe80::c1c1:6930:f17d:a80a]) by DM6PR11MB3819.namprd11.prod.outlook.com
 ([fe80::c1c1:6930:f17d:a80a%4]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 06:30:34 +0000
From: "Wu, Hao" <hao.wu@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH 05/20] Documentation: fpga: eliminate duplicated word
Thread-Index: AQHWVIk/Y5bHJrxi50qxAV1FkuxBtKj+yfCA
Date: Thu, 9 Jul 2020 06:30:33 +0000
Message-ID: <DM6PR11MB3819644AEB6E18E466B06FD785640@DM6PR11MB3819.namprd11.prod.outlook.com>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-6-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-6-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d472f182-d741-43ed-5e61-08d823d195be
x-ms-traffictypediagnostic: DM6PR11MB3913:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB39136E0DF4CB3618FA57E1F485640@DM6PR11MB3913.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SF7WdkEBnMlEIjKRKa7/JeoUarsmTo0ifWfwdYZnwNiIqC8ERMS0Bevrxha6mxIhuHM98vRQFWJr77z92wHA7P0TGlgmHHhrZZwu6agv0s4kLnctWmYoq11vk3t7CsuZ8vth7HspgFP03GQ0BB5PgqXRZk9b8nDzRZKbBE3ULGB6Q0PBzROwJvNStiY6+pZbWQw0KT6QfPPEc4Qav3YvLA/YlhPaeFztNZG8ucTFizMc15vyX2KqaxMHEeDFJNoIPog0yKo5rGkov5DxX5cv/kfz/ybnE08Y9ltGwIpdVmxhhDaf0WzbPjfxrB3rWVLJbTQFdYfw+2BI8ItJ1YDTnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(66446008)(66476007)(64756008)(66556008)(26005)(2906002)(186003)(86362001)(8676002)(558084003)(478600001)(55016002)(9686003)(33656002)(8936002)(7406005)(7416002)(6506007)(71200400001)(7696005)(52536014)(66946007)(76116006)(54906003)(4326008)(7366002)(110136005)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: InmuQg4JNVwe7fxm/sb5gHuqzfy3VyOS6So92RDyrC/Vndot1NMAtvVt0IuPfL+hVyji85rnoIT328ih2uIXsY0MZW5K0WYoMTmc1Fiiv1tHoE4ilsG/GZcH31HTEiwcuiAsjqS5dARVdK3/9UTKWaEZ3kDXmUfA1uiik6ahK8PU18JoJYQw2AKIKWDlsKRh52aeSboYfTTFV7L3k/1yptlKx06QdtpuzLQyfsSuSjilmu+WqJRJBunjzHL+I/PNFAfgWxHj8UQstmjNg4aryffDxlFO5sD1WP7kXt8a/18oUhPLz9OQAL3cPVtiOJl8rFq45kimaqT9Zaw9xq9eq3D8gYTr2LPhVrto6IXQG5xPTB/W296G/qheSqKbe7c8alGUUKvS+QzBgKwkGk9u9gyVghQkVwV33rNpIg2v2Vbpkl4M+RrSLCalXX5u17T+84HrL9nN/bxy/xwpFSvbn0QFS5tgx96IWKasKVGLZ01oWMSEc/TyKPkonkmTzHcb
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d472f182-d741-43ed-5e61-08d823d195be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 06:30:33.9294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEHZds5rLvF+AAF1b0psG0b62s4Hv2Sp28ndkLtmZlJVbyUdrDmYHnh7elldVafAYLTuUS/3D28eMrHKqXiDjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3913
X-OriginatorOrg: intel.com
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jtQ4x-00EpTe-B2
X-Mailman-Approved-At: Thu, 09 Jul 2020 11:01:11 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 05/20] Documentation: fpga: eliminate
 duplicated word
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>, Liviu
 Dudau <liviu.dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 "linux-mm@vger.kernel.org" <linux-mm@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Andrew
 Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wolfram Sang <wsa@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

> Subject: [PATCH 05/20] Documentation: fpga: eliminate duplicated word
> 
> Drop the doubled word "this".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Wu Hao <hao.wu@intel.com>
> Cc: linux-fpga@vger.kernel.org

Acked-by: Wu Hao <hao.wu@intel.com>

Thanks Randy.

Hao


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
