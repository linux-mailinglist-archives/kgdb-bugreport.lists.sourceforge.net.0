Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC024495D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 14:07:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6YUI-0001m7-Dw
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 12:07:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k6YUG-0001lz-HR
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 12:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTYBrkMPYKHND6Y0Pf59epaQl0DOsspR8aK4JTKm68k=; b=fvAYPXxidOpNq4gYnWj7zYCkbw
 X7newdx98oX9VhlXSi6YytERiFbcLdNghNwUtXSlQbmPJu7ssBpH+Syypumc5B6JtZ3l0XyqpIXMl
 0diAAJ1T6X9sphHyV6v7GGi5rVEVlR/VLsyGmR2cbTeSYOCl+tEOilDx34+YxJRP9Tqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTYBrkMPYKHND6Y0Pf59epaQl0DOsspR8aK4JTKm68k=; b=SjsBJeTYQlJyAJToClZODZfHpL
 OTulis5kUOFVgGicMAaGRDrrKzGRzQZU//S3Ib2oKAiGyIXdjQZDvxyirFIvndQjrFeVumjL6gspx
 aHMYbh5KxBQp6orr3kRAZ2PMkzApkwrt3QUIydgOsG+NoC7CxPkAKmKH7+UzgH+iDBBE=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6YUA-0073Un-9u
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 12:07:08 +0000
Received: by mail-lj1-f195.google.com with SMTP id g6so9622737ljn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xTYBrkMPYKHND6Y0Pf59epaQl0DOsspR8aK4JTKm68k=;
 b=rCN61g45Uj5RAeXU3ZrO9R56Wpm3Zvr8GekOvDvvz4aIZohZJYliwqW0KKfipQpjm3
 dfRAg7XvqBHvcBi737ixXx66TqbFyytmlFrdedZGT5Qv1vO81xuIqjq1ioezmWC/I+Xr
 GM/P4FLNaWnPV4nY8mmekeRA4CDISmoug8hYnFLSrH+ol+7od7RmQMNLXzGYH3ODgCFE
 tqR0bEdTscFbskdo6XQxyrUOwv4glcS592tDiVgA/y8iQ+vS875dbPGxMPpoZjFi7oh1
 A112kq6ZPpG25ilSPSbHbbb2o8QnxfLsFyohMMGo3mwJmvn71xxuVV8GdGECB7M6GsxN
 qsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xTYBrkMPYKHND6Y0Pf59epaQl0DOsspR8aK4JTKm68k=;
 b=gf0sr1NliNIT2LFdWJtupgIz/Sjm5h3ZXcH2+g3O9KHaQigH/191y4oPffou8rnmox
 9tK1X5k3ZbLdAeCA1Z4NuI7zOH5RnG9nA42E8wfHrgbB0IOEm0poPvoLACTHN9VIbveq
 wQG5bYjtzj4zUzWe8/SO+Jwkj+x9tpYjWmrCovxS0EfJSZHMFDQscwAm/ZGykZPJS+O4
 03DoFZAhJnmY6aNr8q4JZwQ1W9zkzIr9bbEGKfhyr8eD614ohH9RyA17sbC3asgc/KT3
 vJkITTU3ilt1zcsibsymjD/kqMjGis4CXAGVUgSS2uE9wfH/kh6UHiVLjAJwIDcxINAy
 hqyw==
X-Gm-Message-State: AOAM532qnK+NDwPpeA/Jt1vnV9pdnnUE/O877MnfE8noGxwCNYol3qm0
 L9oDt9cAMuyZ8EGgCovwwBJZxeCKKbEPY7cnADrD5A==
X-Google-Smtp-Source: ABdhPJywj23a4nvERV3TKhIYGPaMXV4zmy4h23AHgBTAYyeNijyM6bL8LmRUqDcquSKjRsPVWJJY9vAMmjV8KCcU/+Y=
X-Received: by 2002:a2e:3202:: with SMTP id y2mr1253902ljy.30.1597406808381;
 Fri, 14 Aug 2020 05:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
 <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
 <CAD=FV=V8UhQVQvcAp6XCmT3=6FYM=_zPELy4FTj4kMKUswaR8Q@mail.gmail.com>
 <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
 <20200813101703.566thqmnc2d7cb3n@holly.lan>
In-Reply-To: <20200813101703.566thqmnc2d7cb3n@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 14 Aug 2020 17:36:36 +0530
Message-ID: <CAFA6WYPd-fcDkYNk1KrjYwD=FH3FBvjDGEoxCBBN9CRidoVXbw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k6YUA-0073Un-9u
Subject: Re: [Kgdb-bugreport] [RFC 0/5] Introduce NMI aware serial drivers
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 13 Aug 2020 at 15:47, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Aug 13, 2020 at 02:55:12PM +0530, Sumit Garg wrote:
> > On Thu, 13 Aug 2020 at 05:38, Doug Anderson <dianders@chromium.org> wrote:
> > > On Wed, Aug 12, 2020 at 8:27 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > One
> > > > last worry is that I assume that most people testing (and even
> > > > automated testing labs) will either always enable NMI or won't enable
> > > > NMI.  That means that everyone will be only testing one codepath or
> > > > the other and (given the complexity) the non-tested codepath will
> > > > break.
> > > >
> >
> > The current patch-set only makes this NMI to work when debugger (kgdb)
> > is enabled which I think is mostly suitable for development
> > environments. So most people testing will involve existing IRQ mode
> > only.
> >
> > However, it's very much possible to make NMI mode as default for a
> > particular serial driver if the underlying irqchip supports it but it
> > depends if we really see any production level usage of NMI debug
> > feature.
>
> The effect of this patch is not to make kgdb work from NMI it is to make
> (some) SysRqs work from NMI. I think that only allowing it to deploy for
> kgdb users is a mistake.
>
> Having it deploy automatically for kgdb users might be OK but it seems
> sensible to make this feature available for other users too.

I think I wasn't clear enough in my prior reply. Actually I meant to
say that this patch-set enables NMI support for a particular serial
driver via ".poll_init()" interface and the only current user of that
interface is kgdb.

So if there are other users interested in this feature, they can use
".poll_init()" interface as well to enable it.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
