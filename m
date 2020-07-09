Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CC21B2CD
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jul 2020 11:58:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jtpnN-0000rn-GU
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Jul 2020 09:58:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <masahiroy@kernel.org>) id 1jtYpl-0002fO-Sg
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 Jul 2020 15:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OtxKPGTO/pZbwYh7E0pVV6aQCW7rvgzMKyprc/l7uvw=; b=a1yHbEMyZQw5/JDElrD2afDhLs
 7E06Q1w1p3S3pWPHNC9nactOR93dc5g9ITs4RhhWXUTNqr8l/8eY6YNMp+Nt8yVpCIvDI157ssgnc
 b1Ff2W13bC3cNh7RP5f7dPg++Qec2g1j1N9MxE6uGVAtvVwsWQLHKiAhtHzv5pJ+zbdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OtxKPGTO/pZbwYh7E0pVV6aQCW7rvgzMKyprc/l7uvw=; b=QJFK9FLFHQd7gF0NfoYZ0XxhxO
 6t96piJdJeNhbG0HO3ltTXtACgMWFniUD9oypEJJwUQign6u2XGof/4fH2DSo3UbYU6Nkf29LMDvV
 tHlU8Zc2YhJO6Yaf2CuizfJyW8wTTcwOExUS7YoWJovLI6Jc5nSmYWX7zeQZBS/tSAzU=;
Received: from condef-06.nifty.com ([202.248.20.71])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtYpj-00CHXc-Cj
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 Jul 2020 15:51:37 +0000
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-06.nifty.com
 with ESMTP id 069FW1Nc021605
 for <kgdb-bugreport@lists.sourceforge.net>; Fri, 10 Jul 2020 00:32:01 +0900
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 069FVm0v018248
 for <kgdb-bugreport@lists.sourceforge.net>; Fri, 10 Jul 2020 00:31:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 069FVm0v018248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1594308708;
 bh=OtxKPGTO/pZbwYh7E0pVV6aQCW7rvgzMKyprc/l7uvw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zm05RQOKC4UC9n7Xn1ZXjbCqDmkS1TdKFlXP6HiaUyy8+P271atINtnP5ZMkoKA/I
 dKdB8AqlMTXV/IhPEiGfkV+MbBtccqvbt2rPj+6JBq85vK2vd4wMCE6iyCDwG0yIQR
 BpRbrz6NawuDmo+bfDRGercgEe8Y8igi5wmYqOkK58b0JNw19pNRLoHsob8kyqESP5
 pxiIRDy6QyDHgtv8T0TKdzMO2ShaRs+ILfMw2UrYKqjSEwI63lKn49rsBUpa3Ki4gw
 znnyKl9VA4WZyZ6QdfOV7khrO36QOGxJNYmS0V49ktOjdNCICWDXkOUGT1TfqkSUs1
 wjwCRksM9ApSQ==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id h18so852484uao.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 09 Jul 2020 08:31:48 -0700 (PDT)
X-Gm-Message-State: AOAM530sZytc2mYaHwwdX8d9S2iQgTCh2g/zdq7kGDBzMUDVfWHyaSL0
 W/34zDOIGcMnCkB5xLT4EPl84HYiZxwREIYMb78=
X-Google-Smtp-Source: ABdhPJxAnxTJNTtnQtFovYQkrUal1o80dMPa969JqVz6oQaG8jBDcy1jbc08IXGNVNtiEaHsg2cPflWUKNAmtElJid0=
X-Received: by 2002:ab0:71d3:: with SMTP id n19mr46109137uao.25.1594308707342; 
 Thu, 09 Jul 2020 08:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-11-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-11-rdunlap@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jul 2020 00:31:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQB6DCw3CZyViCOWCZURfHQKm2JFx0Ypfhai9ecX6T9GQ@mail.gmail.com>
Message-ID: <CAK7LNAQB6DCw3CZyViCOWCZURfHQKm2JFx0Ypfhai9ecX6T9GQ@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: markovi.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.248.20.71 listed in list.dnswl.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtYpj-00CHXc-Cj
X-Mailman-Approved-At: Fri, 10 Jul 2020 09:58:16 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 10/20] Documentation:
 kbuild/kconfig-language: eliminate duplicated word
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
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jul 8, 2020 at 3:06 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "the".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Masahiro Yamada <masahiroy@kernel.org>



I guess this series will go in via the doc sub-system.

If so, please feel free to add:

Acked-by: Masahiro Yamada <masahiroy@kernel.org>






> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Documentation/kbuild/kconfig-language.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20200701.orig/Documentation/kbuild/kconfig-language.rst
> +++ linux-next-20200701/Documentation/kbuild/kconfig-language.rst
> @@ -681,7 +681,7 @@ translate Kconfig logic into boolean for
>  find dead code / features (always inactive), 114 dead features were found in
>  Linux using this methodology [1]_ (Section 8: Threats to validity).
>
> -Confirming this could prove useful as Kconfig stands as one of the the leading
> +Confirming this could prove useful as Kconfig stands as one of the leading
>  industrial variability modeling languages [1]_ [2]_. Its study would help
>  evaluate practical uses of such languages, their use was only theoretical
>  and real world requirements were not well understood. As it stands though



--
Best Regards
Masahiro Yamada


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
