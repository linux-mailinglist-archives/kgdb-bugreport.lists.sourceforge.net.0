Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE6FCA96
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Nov 2019 17:11:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iVHiP-0007Ro-0L
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 Nov 2019 16:11:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iVHiO-0007Rd-2p
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 Nov 2019 16:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m/6eJjoqatlkHX327WsvzFKy6FL3fKgPjPYcZivid0o=; b=fNjW7w8IcjiSupGR5zX0rVUNz+
 0RfW5ZrEsmixhmFuN1T3is4kxS3UKu7i7c/gDrhngzPq/PVr7krO9t4wkSYeYPZGCTrJEIxoMhkjF
 3w6FdBBOGLxUkuTbXAf+pWHQ8qUjpJ+EJgnvqBfKYrzi6IkpC4D1H8v0zSedIBAx/yKw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m/6eJjoqatlkHX327WsvzFKy6FL3fKgPjPYcZivid0o=; b=k62DgR3j3LGcStDia2qpnPntsL
 1J5FP/xzCYEbxBIPPdRKl45HZh9+Yn5GV57eL5W2ahjk23yQVWZFQINpiymJtyYmDv0P03Gjsvt2X
 A2uI1l72FGyydeFgmuxTUAW+avsT6QDGGZ7gtgkkPdOk9zpfKKxXc5vWYpuwPOM9oeks=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iVHiM-003Kui-Es
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 Nov 2019 16:11:24 +0000
Received: by mail-il1-f193.google.com with SMTP id a7so5816753ild.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Nov 2019 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/6eJjoqatlkHX327WsvzFKy6FL3fKgPjPYcZivid0o=;
 b=AiurrKxewNIgEi3Qc6AI4HYquUZOxMUDDDEB4z7QR5Qc3jretuIDN/CPqLL/KNil0+
 uG62v8LYmfkf3YQQ+ZypHZUpDwShD0oQL4dCmML/1uNfP7DOAg/9G85ZtXxpPcKJ24y0
 fmQVgK/gitIAxmcJYMo0YJjFbj5qdty2SABIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/6eJjoqatlkHX327WsvzFKy6FL3fKgPjPYcZivid0o=;
 b=tm5CDiIry3dNFe3OsA7w4J+eAtO0XKiq7Pkk6eJszMBZ/cgnxSiqIE573luB/zTPHe
 oYeO5yFpWMYLaq5rVDsUJ+hY04/3/nAkW1dmDxv1mKxF6g2fwKXRgJAgvR7HNNyoL144
 hdaA9dvfdjTDZrPXQA7mHntdvrs/P6hs4Sp9e6EGf4xjcKKiNGKlDiS4/YixWK14dWGA
 UTF+hwE2iKs2otJX4/xvUd2Ve+wgyTjz0eLR6hBGnUDNF8x6SDBaSylol6LH07xAJ3hH
 7G4eCLNMecZUBAhCROCezFe7AOGxoIRofRrDRnW+SWYRZAXLc5OCda/fjW9CvgNpddkx
 ZnAg==
X-Gm-Message-State: APjAAAV5BbeJWvGsrtXzqq4T8+Lgcp4za9dfmyKBRYPFDANRPerqmB4V
 YU+Ph03clHnxTqRhTe3/pE2UIuLW0B4=
X-Google-Smtp-Source: APXvYqwSzTBRZTG4E0hN5R1K5G4P/VJxNJZHL+5VYA78JTmQGLwoBwT9d6ZsZryJGlrFqTGNr2/hDg==
X-Received: by 2002:a92:3b0c:: with SMTP id i12mr10526389ila.190.1573747876177; 
 Thu, 14 Nov 2019 08:11:16 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id h14sm837265ilc.87.2019.11.14.08.11.14
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 08:11:15 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id p6so7388513iod.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Nov 2019 08:11:14 -0800 (PST)
X-Received: by 2002:a02:a813:: with SMTP id f19mr8010531jaj.12.1573747874146; 
 Thu, 14 Nov 2019 08:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20191109191644.191766-1-dianders@chromium.org>
 <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid>
 <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
In-Reply-To: <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Nov 2019 08:10:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xkxm-eTXmU9s+Bu+biLmjkioVqmHZEBVguZ85cCQywog@mail.gmail.com>
Message-ID: <CAD=FV=Xkxm-eTXmU9s+Bu+biLmjkioVqmHZEBVguZ85cCQywog@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iVHiM-003Kui-Es
Subject: Re: [Kgdb-bugreport] [PATCH 1/5] MIPS: kdb: Remove old workaround
 for backtracing on other CPUs
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
Cc: qiaochong <qiaochong@loongson.cn>, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Burton <paul.burton@mips.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>, James Hogan <jhogan@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Nov 14, 2019 at 2:51 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Sat, Nov 09, 2019 at 11:16:40AM -0800, Douglas Anderson wrote:
> > As of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
> > that aren't the master") we no longer need any special case for doing
> > stack dumps on CPUs that are not the kdb master.  Let's remove.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I have no way to test this personally, so hopefully someone who uses
> > kdb/kgdb on MIPS can.
>
> I took this as a hint to add mips support to kgdbtest ;-)
>
> Support is added and working well. Unfortunately lack of familiarity
> with mips means I have not yet figured out which mips defconfig gives
> us working SMP (and what the corresponding qemu invocation should be).

Nice!


> I think that means I still can't (quite) exercise this code fully.
> The most appropriate test is bta on an SMP system, right?

Yeah, or at least "btc".


> > Ideally this patch should be Acked by MIPS folks and then land through
> > the kdb/kgdb tree since the next patch in the series, ("kdb:
> > kdb_current_regs should be private") depends on it.
>
> An Acked-by from a MIPS maintainer would be very welcome. Perhaps
> with a bit of extra work on the above I might be able to provide
> a Tested-by:.
>
> I didn't see anything that particularly bothered me in the patches but
> given we're already at -rc7 I'm inclined to target this patchset for 5.6
> rather than 5.5.

That's fine.  This is all just cleanup stuff so targeting 5.6 is fine.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
