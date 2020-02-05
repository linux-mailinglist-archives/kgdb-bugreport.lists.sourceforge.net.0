Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9371538CD
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  5 Feb 2020 20:12:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1izQ5k-00009r-Oi
	for lists+kgdb-bugreport@lfdr.de; Wed, 05 Feb 2020 19:12:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1izQ5j-00009b-Nk
 for kgdb-bugreport@lists.sourceforge.net; Wed, 05 Feb 2020 19:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcERuPTreB1RdPPHaPDmwJiWCBqhIbQ/kkvuwoX6k74=; b=cCReEwWo3bnoRMRCoFqtDpbq+b
 EYqeiI7heOTP7DuftGxd3gABQ0W+3KZRhIylmNYim0mosBVyHiIHpjbZPg3s8fxTvBHewuNlkN46o
 EP1ehFiSpU14XDcub6dlbKHzoKcCoI4NIxV1gzoTRE91jMd8nCE4NnSRnQmbBC/yFOuU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tcERuPTreB1RdPPHaPDmwJiWCBqhIbQ/kkvuwoX6k74=; b=KIlCM+NoTRj6ydgJleo3ZVtac9
 HYOQ6WtEjLcFMOjAfF3gAfzGMuG3nxlE6VLOEXscWqoYLXfjF+rl0fA2OnlNnuSXFd8iloj21Xsrt
 WxcV5NBCQqLoofOpMEfaMokVAQmnGHoE69XyBL48dOU8n1Y0f7qwkjMBRZmGaxGCpTik=;
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1izQ5h-000Ulm-Fh
 for kgdb-bugreport@lists.sourceforge.net; Wed, 05 Feb 2020 19:12:03 +0000
Received: by mail-ua1-f68.google.com with SMTP id y23so1291637ual.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 05 Feb 2020 11:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tcERuPTreB1RdPPHaPDmwJiWCBqhIbQ/kkvuwoX6k74=;
 b=oVpH+7hbPNdJnNsLjdBlqZ71TWR1mX/Dt0ANmSlQg+wjEIEYcnIMa/ZCjtuvTu8Y+f
 lCVBpkS9eO35HQytqbp7j4bcqcVd9+uKbZwVawuzrzSvB4eVvCdhMu5aVmOy8WGjnK11
 myPmLTbHd+oIm9FFyuy3G1w83Z8aW2eC71Gdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcERuPTreB1RdPPHaPDmwJiWCBqhIbQ/kkvuwoX6k74=;
 b=lOYiivxgecetW2RRyNpFZJ9NdP/YNldSxuC3yzvNsu+ZPPqVwV4HwBJJCSpArgI7Fz
 lvQgoU/ZwY0W6AEy2F2rDjdkkO3qwJp7nYyY0e0w5tqt2JWd0iJEsnU1ESNb/Rv4wmg+
 gCeWQHImeYlz0M5SilptQQNxxT8o8u0zFjSg4fXPKPODEkG9X2JSBvZoIPeVHzxiqKFI
 sav/NFUmsqW5DU4Qk3hCKiQFyjLFKW1JcDPuSycu1VxEr1YmRhZh5NApkvsQyXefR6Ix
 Ig3XU3GgtudxtKMY3YyLuU9HAb0I13gceLHttJ6dY0Q48HGm1B3C9gGGcmyq+pSCEKXq
 iseQ==
X-Gm-Message-State: APjAAAXWjlah0mx+mykj39qHgtT9wNzZob6inaULINkCJbRND4yujOki
 7HHnXGqJv/fCAKksWSt2WH5GivJz4so=
X-Google-Smtp-Source: APXvYqwGyhNtVZk7uPr/lh43vLfAa+WP5vJ1AdnIpZ+tAjHlhpB9G7AbxAqxTsoIYvnCfekwJog2KA==
X-Received: by 2002:a9f:2612:: with SMTP id 18mr20885321uag.76.1580925691125; 
 Wed, 05 Feb 2020 10:01:31 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id g26sm173565vkl.16.2020.02.05.10.01.29
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 10:01:29 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id 73so1194067uac.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 05 Feb 2020 10:01:29 -0800 (PST)
X-Received: by 2002:ab0:724c:: with SMTP id d12mr21945531uap.0.1580925689110; 
 Wed, 05 Feb 2020 10:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
 <20200205173042.chqij5i53mncfzar@holly.lan>
In-Reply-To: <20200205173042.chqij5i53mncfzar@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 10:01:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
Message-ID: <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1izQ5h-000Ulm-Fh
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix compiling on architectures
 w/out DBG_MAX_REG_NUM defined
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
Cc: Anatoly Pugachev <matorola@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, Chuhong Yuan <hslester96@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Feb 5, 2020 at 9:30 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> > In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> > if current task has no regs") I tried to clean things up by using "if"
> > instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> > architectures define some of the structures that the code is referring
> > to.
> >
> > Let's switch to #ifdef again, but at least avoid using it inside of
> > the function.
> >
> > Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> > Reported-by: Anatoly Pugachev <matorola@gmail.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks for being so quick with this (especially when if I had been less
> delinquent with linux-next it might have been spotted sooner).
>
>
> > ---
> > I don't have a sparc64 compiler but I'm pretty sure this should work.
> > Testing appreciated.
>
> I've just add sparc64 into my pre-release testing (although I have had to
> turn off a bunch of additional compiler warnings in order to do so).
>
>
> >  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index b22292b649c4..c84e61747267 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
> >  /*
> >   * kdb_rd - This function implements the 'rd' command.
> >   */
> > +
> > +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> > +#if DBG_MAX_REG_NUM <= 0
> > +static int kdb_rd(int argc, const char **argv)
> > +{
> > +     if (!kdb_check_regs())
> > +             kdb_dumpregs(kdb_current_regs);
> > +     return 0;
> > +}
> > +#else
>
> The original kdb_rd (and kdb_rm which still exists in this file) place
> the #if inside the function and users > 0 so the common case was
> covered at the top and the fallback at the bottom.
>
> Why change style when re-introducing this code?

My opinion is that #if / #ifdef leads to hard-to-follow code, so I
have always taken the policy that #if / #ifdef don't belong anywhere
inside a function if it can be avoided.  This seems to be the policy
in Linux in general, though not as much in the existing kgdb code.
IMO kgdb should be working to reduce #if / #ifdef inside functions.

In this case, the duplicated code is 1 line: the call to
kdb_check_regs().  It seemed better to duplicate.  Another option that
would avoid the #if / #ifdef in the function would be as follows.
Happy to change my patch like this if you prefer:

#if DBG_MAX_REG_NUM <= 0
static int _kdb_rd(void)
{
  kdb_dumpregs(kdb_current_regs);
  return 0;
}
#else
static int _kdb_rd(void)
{
 ...
}
#endif

static int kdb_rd(int argc, const char **argv)
{
  if (kdb_check_regs())
    return 0;
  return _kdb_rd();
}

...or if you just want to get something quickly so we have time to
debate the finer points, I wouldn't object to a simple Revert and I
can put it on my plate to resubmit the patch later.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
