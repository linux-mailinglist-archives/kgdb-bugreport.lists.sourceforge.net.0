Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9F1C9F08
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 May 2020 01:14:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWpiO-0007fo-C6
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 23:14:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWpiM-0007fh-DN
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 23:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fcgsSpkOF4V2/dMkMwoZFNyt4xCzZWf3dkFNjsli0zk=; b=HejqSL8HH0jx7YiAiS/SpH7T1z
 GOSY10JsUQODF01UwceOZKQdMpBUfKx9bBFltLe5rx+EqZnTg/6wCdIw9AxHGBRfXFI1bGLsniM9g
 xfzK5cPp464qQPAXyDcSDChGfxzyyWIQ6El3+rdwWVRIsr8r42gmI7SCRSJMaAqL5NWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fcgsSpkOF4V2/dMkMwoZFNyt4xCzZWf3dkFNjsli0zk=; b=EiRJaiBx09jJlVpYSTGKlYCI76
 GAmnE6v1B+Q7G3+aokP88E9HnL5xtIEJkny1lhMKXBxxpH2viMMfwCspNz7D3gglZVvi4BefiZcz9
 f1hM5VmF1z97xRyJr3vjA56ZbpxMEUCUMGQJU9AjbtDtqcKb5F4dCOb2z3aa+mR+YGXM=;
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWpiK-00BmrH-NU
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 23:14:02 +0000
Received: by mail-vs1-f67.google.com with SMTP id y185so4536018vsy.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 16:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcgsSpkOF4V2/dMkMwoZFNyt4xCzZWf3dkFNjsli0zk=;
 b=mBZidmmPO+ALfIEafwpB3wu14fPRgMvEfTO6vKXBbWujEOWhsImPNL+r3wnUG5WvGy
 dn/ZYE1eKpBzfNbebCQDk25V+8id5VgOzM8nHflavKdMaZI5O+VTx/QB+P9FwlPQOzfb
 +XGyxarvQuOB7t5RKVuMECQLXt9CjQywEdxz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcgsSpkOF4V2/dMkMwoZFNyt4xCzZWf3dkFNjsli0zk=;
 b=TYAq4z3doY3eq6KdDZlvX2LbbxNPykGpej6tQXd+jxJYAY9xrJzi8DtWqDzpxPbwJv
 65QI3m0E/ongnzqMvctyPpwmXyLUlO1VenhdBSUh2MonFz0RvxSxLezIDvNYz2DLVS7i
 nSYJV7G/jTtZvLMKnQ0dkdZbeamrF9EwvsoSDVT00nsDRcvJ/1ri22SWBIjpN6136MSO
 JvDZJO8dAbePRNMrMg8uR81/oZ72IpczQlpcpc0Hu6EEzyVBz6wDdZnGUUblapWGzgql
 K80cY2pwaJPnmQqHT2grAovQw8hrAWWMlk2xw5wKbEiz+X5pBqABV1QtT3mocZwPdnBH
 cInA==
X-Gm-Message-State: AGi0PuZNJRzIHBWX906eH+IOFm8L2vxyop8m8Q2i+2tdHaVsr+8LGyp2
 2ovqBW+vqWuiirruIoGPgmibbOB23IM=
X-Google-Smtp-Source: APiQypIY5mZ4jXenWdWOO3fa5h9SLZJS1tdTKItnt9JWjGsadDwVcjMF1ZHFlUu+XTQ9xBQFb2HfZA==
X-Received: by 2002:a05:6102:7c5:: with SMTP id
 y5mr12956244vsg.108.1588893234380; 
 Thu, 07 May 2020 16:13:54 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id x124sm4053408vkb.34.2020.05.07.16.13.53
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 16:13:53 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id n207so1978329vkf.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 16:13:53 -0700 (PDT)
X-Received: by 2002:a1f:5fc3:: with SMTP id t186mr13876099vkb.92.1588893233117; 
 Thu, 07 May 2020 16:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200213150553.313596-1-daniel.thompson@linaro.org>
 <CAD=FV=Uqgjgf+hL7=tpBixyxiDhXA_k5kfZ1RUtk6f+CVgUikg@mail.gmail.com>
In-Reply-To: <CAD=FV=Uqgjgf+hL7=tpBixyxiDhXA_k5kfZ1RUtk6f+CVgUikg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 May 2020 16:13:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUj3gPmY0TznsneWMgWO6m_WqauTiYocnihm6byVU=YQ@mail.gmail.com>
Message-ID: <CAD=FV=VUj3gPmY0TznsneWMgWO6m_WqauTiYocnihm6byVU=YQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWpiK-00BmrH-NU
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Eliminate strncpy() warnings by
 replacing with strscpy()
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Mar 3, 2020 at 12:52 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Feb 13, 2020 at 7:06 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > Currently the code to manage the kdb history buffer uses strncpy() to
> > copy strings to/and from the history and exhibits the classic "but
> > nobody ever told me that strncpy() doesn't always terminate strings"
> > bug. Modern gcc compilers recognise this bug and issue a warning.
> >
> > In reality these calls will only abridge the copied string if kdb_read()
> > has *already* overflowed the command buffer. Thus the use of counted
> > copies here is only used to reduce the secondary effects of a bug
> > elsewhere in the code.
> >
> > Therefore transitioning these calls into strscpy() (without checking
> > the return code) is appropriate.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_main.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index ba12e9f4661e..a4641be4123c 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -1102,12 +1102,12 @@ static int handle_ctrl_cmd(char *cmd)
> >         case CTRL_P:
> >                 if (cmdptr != cmd_tail)
> >                         cmdptr = (cmdptr-1) % KDB_CMD_HISTORY_COUNT;
>
> The above line (not touched by your patch) is slightly worrying to me.
> I always have it in mind that "%" of numbers that might be negative
> isn't an amazingly good idea.  Some searches say that this must be
> true:
>
> a == (a / b * b) + a % b
>
> ...which makes it feel like this is totally broken because "cmdptr"
> will end up as -1.  Huh?
>
> OK, after much digging and some printouts, I figured this out.  cmdptr
> is _unsigned_ and KDB_CMD_HISTORY_COUNT is a power of 2 (it's 32)
> which makes this work.  AKA if you start out at 0 and subtract 1, you
> get 0xffffffff and then that "% 32" is 31 which is the answer that was
> desired.  Totally non-obvious.
>
> I guess a future change should make the above:
>
> cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
>   KDB_CMD_HISTORY_COUNT;

This has been sitting in the back of my mind for a while.  Finally posted:

https://lore.kernel.org/r/20200507161125.1.I2cce9ac66e141230c3644b8174b6c15d4e769232@changeid

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
