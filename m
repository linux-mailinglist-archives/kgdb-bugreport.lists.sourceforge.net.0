Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 805302188AB
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 Jul 2020 15:14:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jt9uL-0000tE-BJ
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 Jul 2020 13:14:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jt9uJ-0000t7-IU
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 Jul 2020 13:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8TXsMU8pcx7Tss0R/XmiW2rwe2Hix1sm/QIevQOb2M=; b=ZEn3U1TNHK00G826015rf/DrOt
 BcNoezNBkCxOBiFj40LUsBp6AGS6w1Q2vGUCDjFyJBDwkuI5A4Zxm49lmw442bJDD2bqvH/Y/CTFH
 yFWNou0o0EeVeJlsRUt6U5m34b1SvAihd6buxP8+kFJQtDV7SOk88BFbItJMSm2+Q4gA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l8TXsMU8pcx7Tss0R/XmiW2rwe2Hix1sm/QIevQOb2M=; b=lhqFGB2tXynpuydjv1ub196+Kt
 5OSp9O9I5mUNoo6NoKyoZ9PT56RMqvGu3nUCVKCpobJxDmuJlfrN3agvo3ny6vdItGCLUrcCvE6ZU
 m9a1mAoiIyU0NUSdgBZQJed/xH06RTtYTN7wYOLvLUx4ws/7+95wsbQATyp6qA++V6DQ=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jt9uE-00BAh4-U0
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 Jul 2020 13:14:39 +0000
Received: by mail-wm1-f67.google.com with SMTP id 22so3064795wmg.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 08 Jul 2020 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l8TXsMU8pcx7Tss0R/XmiW2rwe2Hix1sm/QIevQOb2M=;
 b=A1ZIjk7YGe2YSEoQCSRgqjmHR7oxja8buIPLjIhRTjdJVpAt9lG0gE7SFtVGHQLadT
 xVpcPloGsK2WSxEeeICvTCCQ1YYB1VSfUPjrX131Kkrf1ua0TB8eUFoz6BcB/ltMdxle
 g0CUQEDldKrVRBTAatDkSdjEu36OQGD68toOzC25aprt3rfyUr9rqTVrTmbAXsTUgf77
 9cR8rDocIEreQ2XYDW7IWJeD90ce47cu6PI8ZsNUWN9GnPzAGJerkmwY1TNG1BH5v+ah
 Y+0oSh28JHhB1q0lkYDfWGe+5f8BNO5h4B8RbndZgEm96Q69dP3WLG/nFIdlxkVQzXH+
 HYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l8TXsMU8pcx7Tss0R/XmiW2rwe2Hix1sm/QIevQOb2M=;
 b=L3P/xUN+4jPiaEJE5OSDCUXOjOZA2C/ujqbsBYl1srunZVSiAhiDjZFCrOXgKn/lyX
 SlbQEG1QHD+8ALSwtlr1YVZMMChuJFzvb8zMdwButkPiRHjmZFhP1YrdEoj+NSjlgzNy
 1/pIKpfnTcx97Davq4b+EQLvAM7/E6eyHVEChnnT5Dsm55EQucKHW/xK7Pk5JHePR3z1
 6sFNrx2LPkaSLNV0CBwRrui01rEcYc+PbLJl8s3XCOdTDYufxLLRBtHrw7gD6iFzEybM
 HqXqmzIkRtWBr3LoCJYK5R6Os3yLCMVDVxlf1IwHfcwMywNa/QXnGrBbYUPVuUgOqoOj
 u9Rw==
X-Gm-Message-State: AOAM531VZ3LTctPyflKXPft97T0+LDOuigIxiF+uIygmPTg0w7gfcl9j
 Kzgoi18i4g/cAZv0oA/osX3wew==
X-Google-Smtp-Source: ABdhPJwq0Oc6xY1jGe2yyxLQ3zEuUYKf/Jmuh4JKlNT9KiWq8rLJ6802Y6Ay8mTXZNr5ogQ7BAfKOg==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr9822665wmj.39.1594214068610;
 Wed, 08 Jul 2020 06:14:28 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n16sm5779824wra.19.2020.07.08.06.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 06:14:27 -0700 (PDT)
Date: Wed, 8 Jul 2020 14:14:25 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200708131425.iesuqtfklrsn3kam@holly.lan>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-5-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-5-rdunlap@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt9uE-00BAh4-U0
Subject: Re: [Kgdb-bugreport] [PATCH 04/20] Documentation: kgdb: eliminate
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kgdb-bugreport@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 linux-block@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Jul 07, 2020 at 11:03:58AM -0700, Randy Dunlap wrote:
> Drop the doubled word "driver".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: kgdb-bugreport@lists.sourceforge.net

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
