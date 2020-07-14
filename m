Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8721EE14
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 14 Jul 2020 12:36:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jvIIB-0005XO-G3
	for lists+kgdb-bugreport@lfdr.de; Tue, 14 Jul 2020 10:36:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel@ffwll.ch>) id 1jvIHB-0005Pt-TE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 14 Jul 2020 10:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T/8Q4L8NXOZkQ/tz+AhfWHGd9ugb/VQ1NTeCRd70fRk=; b=Q9qGtC+dfXH1l+m8falElxF6ak
 59uBfZOXWGEdt4NHjSTDGRw7O/HO0QsSrrYaPi+cEjWQDOmVDBBXx5hbi2oEiDKfLdX4/osEL1nOJ
 eQzJl1qX5B2oZznJeYf3bHhENtmHqLr6lE8eXDZMHKBI0CGYKpFQGJ3faDABsjq+2iwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T/8Q4L8NXOZkQ/tz+AhfWHGd9ugb/VQ1NTeCRd70fRk=; b=mxdlJsG/FnoatPmduxvLrLxvY0
 BnDoH4nH5l+Z4I1J/6IX5W2zRvNyNUFZqjQFHMOHrq1Lt2T8/B6aoOqbP5c7/hauk19t1ggXMYY1S
 IUJ2ic6B8utMcMbNiPfT1Yw6PZm1XYgbJJWr+jSZ4zYRGa5f2Wvcs+e+orqhouBALe1o=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvIH6-002hjj-3s
 for kgdb-bugreport@lists.sourceforge.net; Tue, 14 Jul 2020 10:35:05 +0000
Received: by mail-wm1-f65.google.com with SMTP id g75so4422358wme.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 14 Jul 2020 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=T/8Q4L8NXOZkQ/tz+AhfWHGd9ugb/VQ1NTeCRd70fRk=;
 b=YzSPJ57VF1NPDw3vqT+620LhD0SUy/zauBG1xtDEhX1eUlTmFvCOI0hPBmtLQENSnn
 6/TAH0xl7I97woT37GTVAxBZOLEBHgiaFb9Uqggexgi/xkK28gXQxGwWP9ul8haJdads
 Ov8mi9vjiMKlSJyG96C+bAGNTmgZe5ROyu+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=T/8Q4L8NXOZkQ/tz+AhfWHGd9ugb/VQ1NTeCRd70fRk=;
 b=dFPoTYg/3e0Yc29GN1X5UQptb6ib1kt/gC46YBibHJR9oMpwCXkbdZYAn6S1Q6zLXo
 yPQhqM+rNRCFw2slwmWu+wfPAJO28WOajC27Fi8Prgox/INiEf+CYJ9ga4ahpi0GMaZB
 E34tsW9ju8k1TUrehRO3vbikc5vNW/0HD0w9Gmc4xL7KunCE0SxKGAVOcYFTXDK2xt98
 46s8RCR+7h9M36lWKgJG31xrhDGyWWrHSfKKgaiQzNB38eBrbQ892Iowg0melQcLmtAw
 5n8seKa4NUu/ItIHMZuVKK5CQtcUD9BnnUrdG0V5afnsnx84OQ3+i4iGT+uNVokfyhDz
 pwkw==
X-Gm-Message-State: AOAM533YK0mNqXxA4ynt5RVeG9g+Ez8LNbxH8JGYlyj1XKZDLEGuaNHa
 G8BU7mma0uUwjTBYXBHPRajAsJZh7/s=
X-Google-Smtp-Source: ABdhPJyqFd0o0r7Uhj2GkJDPlWKnVbjeuZeIBdDxA3RZenN7KDJyJSMu/8KGKJnF2dYF5oDa1m5pVQ==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr3323574wme.115.1594721409986; 
 Tue, 14 Jul 2020 03:10:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 33sm30262923wri.16.2020.07.14.03.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:10:09 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:10:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Message-ID: <20200714101005.GA3278063@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-mm@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linux-kbuild@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 nd@arm.com
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
 <20200708050821.GA1121718@jamwan02-TSP300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708050821.GA1121718@jamwan02-TSP300>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvIH6-002hjj-3s
X-Mailman-Approved-At: Tue, 14 Jul 2020 10:36:06 +0000
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

This and next patch merged to drm-misc-next, thanks.

On Wed, Jul 08, 2020 at 01:08:21PM +0800, james qian wang (Arm Technology China) wrote:
> Hi Randy
> 
> On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> > Drop the doubled word "and".
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > Cc: James (Qian) Wang <james.qian.wang@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > Cc: Mali DP Maintainers <malidp@foss.arm.com>
> > ---
> >  Documentation/gpu/komeda-kms.rst |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> > +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> > @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
> >  frame. its output frame can be fed into post image processor for showing it on
> >  the monitor or fed into wb_layer and written to memory at the same time.
> >  user can also insert a scaler between compositor and wb_layer to down scale
> > -the display frame first and and then write to memory.
> > +the display frame first and then write to memory.
> 
> Thank you for the patch.
> 
> Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

James, for simple patches like this just go ahead and merge them. You're
the maintainer for this, just slapping an r-b onto a patch and no
indiciation whether you will pick it up only confuses people and increases
the risk that patches get lost.

So either pick up right away, or state clearly that you will pick it up
later, or that you expect someone else to merge this.

Thanks, Daniel
> 
> >  Writeback Layer (wb_layer)
> >  --------------------------

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
