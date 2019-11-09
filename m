Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 892ACF612B
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 20:21:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTWIL-0004c7-Ck
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 19:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTWIJ-0004c0-Sm
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkH89WBzNu1RX65KEpd7wgGkq9IjrOpUII7CjYIWD7Q=; b=BqhSjiMFWNjZ78yh5C7SUv02TJ
 dK4vSQFNPlsaECbYP6+3UrBKDnfeCTmMY91DHuznsTd7N/wNRqsItKwPuRHJ11lM3nFBeTJFSzbF4
 Zym01xmVR//sCDCDmO59TgpqV2fRMM0eZxzludj7mK67asfsKKqbyRr4hGfDTj68BurA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MkH89WBzNu1RX65KEpd7wgGkq9IjrOpUII7CjYIWD7Q=; b=g0EZJbi36ALK33indEevR2fUD4
 QZsdcx98LYkO6n0s6RrlUHtwYBSTYE8/XMuidIcw0gJE4BJOqGJMIpEhUxDQtNX4q5J4uWn2nnH4L
 e4EIKeifRlNd631Bo7P/2MDm2TCsBI0yTV54lwBss0Jwqv8J1IJvmHwpkCkWNb8lCdeY=;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTWIA-009kqY-Uf
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:21:11 +0000
Received: by mail-il1-f195.google.com with SMTP id u17so3275890ilq.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MkH89WBzNu1RX65KEpd7wgGkq9IjrOpUII7CjYIWD7Q=;
 b=Yx8JTiSUcJDTDqeV3JVqYyR8mb11sdfgDH3KPlIJpVSaAEotIGmprjGixANdnPex4g
 pIs8vrUy87i6mT5L5tHi2oIioAsuUdd7d5Aj3pIZoUS92kclX6r76i5cDjqlujc/WhcX
 A0I0bpGuBFQ1qIPoACyLBYKW8vkRuLumYNpws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MkH89WBzNu1RX65KEpd7wgGkq9IjrOpUII7CjYIWD7Q=;
 b=epf1KW6GwmqeoZcVzE6DNeZXWauRgFgiEYoQR2Wi/yHOZ5+OApFvsDJgpR4k0SpoII
 EZf+GO9dc4pusOSTwxkmFvwu7dB0Xy6CYzJa3crIdJQNCZj70g+6vDxtByJoUpM7jarW
 94T7dv98HFYQ+bqQqa9Yv6wUhcIl0jWUyW0zrB57q3jSZb3XM0edKMqMlpDKo8z6wJH+
 sEImq08kR0Gvi8XX3YEpeItonPEAuacv4uGIQI5sHjF+VdONCeo+eksS5jvF/GQhuYiw
 qJ/KY5feQ24+HVt/jIIHHE8oR8rPy0g8oHXt70AmRIukyC+WxJqzvJfYajZ4ySurewCt
 88gw==
X-Gm-Message-State: APjAAAV61seim3+XdIfHHSHTIGlXo+BrzGulzudoEjasrfOFH6zu7oH+
 F/nP3nmRoN+6OCnHIZajHeC0X5JdFwQ=
X-Google-Smtp-Source: APXvYqz9ms31QqAvHxFwex+FUPa6mqOEsyD/xEQdjtbO9Cjyzk0fpSvvPMB5k6eyrdB9Hq4qW9D+tg==
X-Received: by 2002:a92:40d9:: with SMTP id d86mr21080119ill.303.1573327256997; 
 Sat, 09 Nov 2019 11:20:56 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id y17sm775246iol.24.2019.11.09.11.20.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Nov 2019 11:20:56 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id j20so9680055ioo.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:20:56 -0800 (PST)
X-Received: by 2002:a02:7158:: with SMTP id n24mr18296678jaf.127.1573327255569; 
 Sat, 09 Nov 2019 11:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
 <20191007135459.lj3qc2tqzcv3xcia@holly.lan>
 <CAD=FV=Vqj9JqGCQX_Foij8EkFtSy8r2wB3uoXNae6PECwNV+CQ@mail.gmail.com>
 <20191010150735.dhrj3pbjgmjrdpwr@holly.lan>
 <CAD=FV=VuOVpvEB60-prMxuPyjcrJ-9O2hyaLKf86c-r9BVocdg@mail.gmail.com>
In-Reply-To: <CAD=FV=VuOVpvEB60-prMxuPyjcrJ-9O2hyaLKf86c-r9BVocdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 9 Nov 2019 11:20:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQeHp9=HGWUHHHpYTt0w+AfTMhTrVAjLeiEReszJLJfQ@mail.gmail.com>
Message-ID: <CAD=FV=UQeHp9=HGWUHHHpYTt0w+AfTMhTrVAjLeiEReszJLJfQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iTWIA-009kqY-Uf
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Fix "btc <cpu>" crash if
 the CPU didn't round up
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Oct 10, 2019 at 9:38 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Oct 10, 2019 at 8:07 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > > Reading through other control flows of the various backtrace commands,
> > > it looks like it is intentional to leave the current task changed when
> > > you explicitly do an action on that task (or a CPU).
> > >
> > > Actually, though, it wasn't clear to me that it ever made sense for
> > > any of these commands to implicitly leave the current task changed.
> > > If you agree, I can send a follow-up patch to change this behavior.
> >
> > Personally I don't like implicit changes of state but I might need a bit
> > more thinking to agree (or disagree ;-) ).
>
> I can post up a followup after this series lands and change it.  I
> have a feeling nobody is relying on the old behavior and thus nobody
> will notice but it would be nice to get this cleaner.

Sorry it took so long, but follow-up series can be found at:

https://lore.kernel.org/r/20191109191644.191766-1-dianders@chromium.org

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
