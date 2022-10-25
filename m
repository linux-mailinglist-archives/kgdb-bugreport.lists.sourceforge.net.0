Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54A60C009
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 02:48:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on86u-0005H9-On
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 00:48:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on86t-0005H3-ID
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ak7zVpqmX9JbVC+MV80uP0uvch3zk3QEsTkNiYdThmU=; b=S31lM5adWHqbZz+kks9J+VIkSm
 n05uqxjXGIl8vJWpaqc6n5vB2CfRF1eyoPFYxYGH5KMOBjTVR+S7UliapIkw7jsJ7IxeWaY0KaVQZ
 c6OvvGLaUdmPjnByRYYfJ4rimG6GwNuUmI2vjoZQC+6aNIVs/jPlddD9hZTdhe7gHQEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ak7zVpqmX9JbVC+MV80uP0uvch3zk3QEsTkNiYdThmU=; b=OliRc6NP8iYzyfSmwXeOyPJ5Iw
 wiJwpoR4huGzmo00F3cvkcr1Bjha4urfFSTbPcVrurMJOLgf2yimT1vtEeeMbccnUPh54rWN0lg15
 UNJnhJqcvlhsWkoxhsUR7W7J94NeIpklKtaKAZdy8CXFZTZKa6TRIhFzU8idIAhIifHw=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on86o-0003t6-O1 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:48:01 +0000
Received: by mail-ej1-f54.google.com with SMTP id bj12so8738017ejb.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ak7zVpqmX9JbVC+MV80uP0uvch3zk3QEsTkNiYdThmU=;
 b=VVj2UZgjKW7iLjIjmZ1MR4SJ5NXqYaYawUi1oSjocuBXvgJSo1rjLFy22VbFw5RPlV
 DkOqzTtsYpyeXjE4kCEM3t9rf09NAAvTbdfwt+rF5iou7TooHHypkGX0YZMvHtZzssH7
 oUyDUvwhrZaKJOilCm54ZNV0G4ux7Es875Bsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ak7zVpqmX9JbVC+MV80uP0uvch3zk3QEsTkNiYdThmU=;
 b=ItxOi7AfjhJjYDzb+hjnL0Xv4HehXNbcPY5Ii/eCFdwQzfxz6h0qAXPd/GHdUYHrXB
 ybuLNvFgs/zxxxd5FcuV5CA5SLJFKpwy+zQW47e2QyghSWESsfS7WjKuLR9If/2m+OrI
 n6RwtdsP7D5CCa8QiStvQDGmznyTlXdc6VoOocnPBt39T5OjzF9jspkqGfJUQ6G+RsNa
 s5Gs6heTx8PINbsh8gwtPeo7xOKiP4NBAWgaV8cU9TFRD2rkG+KCyZSMIGB3b2mKPVXJ
 o595uG2SdcucsFx23TjvsYwaq2HfaxcyOrWLEE6ur8yqQi/d08im5ikdPMYCkckkmxXj
 Td6g==
X-Gm-Message-State: ACrzQf1dxXr5LLxyruZyJOqXPZeRRE1pYCg5f2ln9IAnUlDCFotiAv5k
 qwfAWzXMpS1ADv9mkshiKvNBmQhsJLfSVkSN
X-Google-Smtp-Source: AMsMyM7yw0RiI2/1pBTIGsN/XCQzhQNC+zmSpuKkaCrCEoF3WbWgYnr6++EK4aZu3Ca4xsbYlaY9OA==
X-Received: by 2002:a17:906:4fd1:b0:787:434f:d755 with SMTP id
 i17-20020a1709064fd100b00787434fd755mr29005455ejw.356.1666658860198; 
 Mon, 24 Oct 2022 17:47:40 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 e23-20020a170906375700b007a4e02e32ffsm558463ejc.60.2022.10.24.17.47.38
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 17:47:38 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id bk15so18478970wrb.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:47:38 -0700 (PDT)
X-Received: by 2002:adf:db4b:0:b0:236:5665:a925 with SMTP id
 f11-20020adfdb4b000000b002365665a925mr12828901wrj.617.1666658857911; Mon, 24
 Oct 2022 17:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-27-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-27-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 17:47:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3BSOxDV6VKsEfFUdMTzuJr_VSL9GdvqnxN6qJ8tuW=w@mail.gmail.com>
Message-ID: <CAD=FV=U3BSOxDV6VKsEfFUdMTzuJr_VSL9GdvqnxN6qJ8tuW=w@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Oct 19,
 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > Guarantee safe iteration of the console list by using SRCU. >
 > Signed-off-by: John Ogness <john.ogness@linutronix.de [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.54 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on86o-0003t6-O1
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 26/38] kdb: use srcu console
 list iterator
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> Guarantee safe iteration of the console list by using SRCU.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  kernel/debug/kdb/kdb_io.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 550fe8b456ec..5c0bd93c3574 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  {
>         struct console *c;
>         const char *cp;
> +       int cookie;
>         int len;
>
>         if (msg_len == 0)
> @@ -558,7 +559,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
>                 cp++;
>         }
>
> -       for_each_console(c) {
> +       cookie = console_srcu_read_lock();
> +       for_each_console_srcu(c) {

Maybe it wouldn't hurt to also have a comment saying that normally the
console_srcu_read_lock() wouldn't be enough given that we're poking
into each individual console and calling ->write() but that we're
relying on the fact that all the other CPUs are stopped at the moment
and thus we should be safe.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
