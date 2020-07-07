Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D5218880
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 Jul 2020 15:09:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jt9oz-0000ce-PA
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 Jul 2020 13:09:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.j.williams@intel.com>) id 1jstHy-0002sX-0Y
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 19:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJcF3lAERNl2pHWGp39A9gwQbaEBKJzdpdY4Z29brno=; b=J3aUog+ycsFF9wS+pJE45/fynQ
 wCi1087SuMUplPP2ySRqRXpWD2c2YRBabu+DaCGrxXW8bqXP51ItIqj1R1dlMXG1g7C+CrbwgADGG
 pPPFwQqtiA/cxfxMzFEP8EXtykmEbTg68uCv4Rt9XqNBX1Xn3nsIyVqCzDh3nYKl5SkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJcF3lAERNl2pHWGp39A9gwQbaEBKJzdpdY4Z29brno=; b=JOxVdF/Q3kPd8Fw/8eFBtPRyvR
 BP7KLHQmegBp69rnESMaoV2GmO8do4XtwL+Q4/5lsEaL/2Bmz26Dc9YILk+Ok0yQcVW8zpkLbKsYw
 2rfN/RIqSR/qeXhu43uzb49zfy7CqV79QWZEjxGZoV2U+K7s1oeqc5pw1gkUwLhLJ/TU=;
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jstHv-00AVQu-Ie
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 19:29:57 +0000
Received: by mail-ej1-f67.google.com with SMTP id a1so47859763ejg.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Jul 2020 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJcF3lAERNl2pHWGp39A9gwQbaEBKJzdpdY4Z29brno=;
 b=GtYcI34psfamNnVZB54EG+w1stxgeDLcIFiZaiUbR3trVD0lb2aYCNtXamoiJnBwny
 ythvCZsScIhskjQWMpoOh6ln/SwwcT/25kxyMFYQhWpC/rbTe/rrmyfSZLG/cuvsxnqa
 l7MA9Xw7s15QuDh1+Ak8iN66kQHRHsaM338N3pJNQ5oTuLMt83pouJw8vSOKh7ACtsYG
 Vnp8Z7N+H1jOCVpuFx5aa1ln4a2c3CUpVW1grf23B4jd719fP/7YFBdeotJEtj0VCWc2
 bpwjzv49FPEEfKnY9vtw0lDE7jzevmJbQL6im7meQiahBIfu4NZGoL5br4zYm9nbUAv7
 iRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJcF3lAERNl2pHWGp39A9gwQbaEBKJzdpdY4Z29brno=;
 b=oD1nO5+K0T/twfb136ni3bGiUWEarhomP+Zw1svTW5w00XzjKfodrYH4IivMS1mmE4
 0bE31cGP5+kYankjcJmSp6aLqkKmfaH9prBVWoD3wwlcFQxH8OFt3T9PRGxbnCXHl9VO
 5GO5b4MtkVnyVnYm58iNg7ZJ8dG/npHlW+EBIo2aq9fqrbKUE2zFJv++mzhucBiDZv32
 qGYoiLxykUAdMJx6UbMykPHYHmgu82PH7/QAhcozMw+S24TvZRLFj7PDLEJ6YUQcoO28
 n6PAlhUi1Yzu/1mUbJW/Rs6gupL3LPYWzOA1vBiVOJoWrAN6RZjzPVQpiYsqmmqTUIj+
 Mb/w==
X-Gm-Message-State: AOAM53286wcT9F96fyPLxJzWBzNRSxFwmdoSfDm1hkk8O4TClRns32n7
 73Hg7NeTzX8JO4EW79VEkRsaBHtfcFBjWlBb47TW9gV5
X-Google-Smtp-Source: ABdhPJz/k1Lj7S8JXbw1qDGIHYzWAWL1RIZUAULeU0yGbiOgcHknNP96xoeVJ3D+eLW4C9y+LJcZZrAh7dTGJVMuYfE=
X-Received: by 2002:a17:907:20af:: with SMTP id
 pw15mr50524338ejb.204.1594145943817; 
 Tue, 07 Jul 2020 11:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-13-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-13-rdunlap@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 Jul 2020 11:18:52 -0700
Message-ID: <CAPcyv4hsu57988v7bZq9udTTan72NYDw8TrF46LC7bT_cqex2Q@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jstHv-00AVQu-Ie
X-Mailman-Approved-At: Wed, 08 Jul 2020 13:09:06 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 12/20] Documentation:
 maintainer-entry-profile: eliminate duplicated word
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 "open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
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

On Tue, Jul 7, 2020 at 11:07 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "have".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> ---
>  Documentation/maintainer/maintainer-entry-profile.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20200701.orig/Documentation/maintainer/maintainer-entry-profile.rst
> +++ linux-next-20200701/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -31,7 +31,7 @@ Example questions to consider:
>  - What branch should contributors submit against?
>  - Links to any other Maintainer Entry Profiles? For example a
>    device-driver may point to an entry for its parent subsystem. This makes
> -  the contributor aware of obligations a maintainer may have have for
> +  the contributor aware of obligations a maintainer may have for
>    other maintainers in the submission chain.

Acked-by Dan Williams <dan.j.williams@intel.com>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
