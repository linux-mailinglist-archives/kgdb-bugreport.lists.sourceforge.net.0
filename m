Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48B21EE17
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 14 Jul 2020 12:36:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jvIIq-0001Bf-78
	for lists+kgdb-bugreport@lfdr.de; Tue, 14 Jul 2020 10:36:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel@ffwll.ch>) id 1jvIIp-0001BZ-It
 for kgdb-bugreport@lists.sourceforge.net; Tue, 14 Jul 2020 10:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=; b=k0upYq4K97ug/wwE077EUA1poi
 etSfuOg0Xh0uqP1ToahTu1L8wyLPO+Th3Cbnr6hnQ4ccpo8lna65T3lPhtaZJ4sW0GXjzADzjKgFe
 yu9pEQLP8YBQqHUggy1CBdz3NjotNUFN2f0URXbWHGClWh8EOqTXXszMseO817IuTxJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=; b=ay7Ez16B/vaocmabb/q+fre/5C
 tSGAwMSIQqyg5XmqCJyOWfArF/5E3mWuUeNm0K4X/EfRZ+bIvKo4v4NzQ8egFQE38d3krgr7pmQWU
 qQ2txeoFGOxHl7kxOJTF4B+rskHMuIkD0rrwKu4He46E1sBSQJ1mS9eTl0nQy54+hAxI=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvIIn-00HIqV-3T
 for kgdb-bugreport@lists.sourceforge.net; Tue, 14 Jul 2020 10:36:47 +0000
Received: by mail-wr1-f66.google.com with SMTP id b6so20691751wrs.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 14 Jul 2020 03:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=;
 b=YrcDDo2hP5M68Ak8M7jsKPUTs7yD6/ADyMMgpPJg442GJRgPGP+jCxljWP3trEqyTE
 QOK/gRwpRbKojsplhpXoZipPym/tq9vaDlYDnM8AoXUuGx1MmGgAD38eAYYxbNAHn1aX
 z8h9SSiDlHidMaX1MKCyAlI/GZvt0IAKvagEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=;
 b=H1lfD/HkGGUNgsqqlvU/8oNW42uwqLOaEx0D9J7hK7LlmCb22QSy+Qs5LQH7nGwTqA
 7bHLus8BrI9aYIT8TOT1K7kAMrdDWAXcSrvqfDT4DlmXjTSxk2km7Vu/keCWpoGU72lU
 cpPkVACHL8e0OybFka/T3pN1AYvvJwr6fjvCThzf/NkIPr5KK8/VfBse/vdVyS8XjJ7N
 ZhzreIoSat8QDK4l0o8tuJkj1K+/wVK8DprEkMaXguql7TwWrRO6I0eNUrj0cmPhropW
 VGUxuYF4Xcg9Kpux3sMXGLFmven6RjWsEGwjizowp1aTNHUUTiie3rsli23uioj2LbY2
 F63w==
X-Gm-Message-State: AOAM532akj7P4qR3OQRsds562LkN8Zux1zdnyzSxpuUlMjn6BfvbVpEO
 YMrgD5iRId5CwZV4UCMEp+U9pmOZ2fk=
X-Google-Smtp-Source: ABdhPJwmiWZVvfzELvtSnftev0XNz5kRmchhtWQAJnH3b79CIxD1ms2dJU5USjC+U/HesEOe1K7f7A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr4044229wrf.278.1594721493115; 
 Tue, 14 Jul 2020 03:11:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d201sm3498227wmd.34.2020.07.14.03.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:11:32 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:11:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
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
 Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, nd@arm.com
Message-ID: <20200714101129.GB3278063@phenom.ffwll.local>
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
 <20200714101005.GA3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714101005.GA3278063@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arm.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvIIn-00HIqV-3T
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jul 14, 2020 at 12:10:05PM +0200, Daniel Vetter wrote:
> This and next patch merged to drm-misc-next, thanks.

Oops strike this, I just noticed that Jon said he's picked it all up.

Oh well, the confusion, I managed to stop the script before it published
anything at least :-)
-Daniel

> 
> On Wed, Jul 08, 2020 at 01:08:21PM +0800, james qian wang (Arm Technology China) wrote:
> > Hi Randy
> > 
> > On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> > > Drop the doubled word "and".
> > > 
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: linux-doc@vger.kernel.org
> > > Cc: James (Qian) Wang <james.qian.wang@arm.com>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > > Cc: Mali DP Maintainers <malidp@foss.arm.com>
> > > ---
> > >  Documentation/gpu/komeda-kms.rst |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> > > +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> > > @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
> > >  frame. its output frame can be fed into post image processor for showing it on
> > >  the monitor or fed into wb_layer and written to memory at the same time.
> > >  user can also insert a scaler between compositor and wb_layer to down scale
> > > -the display frame first and and then write to memory.
> > > +the display frame first and then write to memory.
> > 
> > Thank you for the patch.
> > 
> > Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
> 
> James, for simple patches like this just go ahead and merge them. You're
> the maintainer for this, just slapping an r-b onto a patch and no
> indiciation whether you will pick it up only confuses people and increases
> the risk that patches get lost.
> 
> So either pick up right away, or state clearly that you will pick it up
> later, or that you expect someone else to merge this.
> 
> Thanks, Daniel
> > 
> > >  Writeback Layer (wb_layer)
> > >  --------------------------
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
