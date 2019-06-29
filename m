Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A30155B837
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jul 2019 11:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA/qQqPv7KHJ/KRkZeApCxMAHYQz2I9EmCK9+9qwYi4=; b=d+pK7qPp/uFcLLNkvpQn2Ksnaa
	SNC4rG8VDp8V6w9IybnQdngW8hHW+CN4FDGK12Ykk8P3qxZJr04aKoVhGMdHFBXGsJfhwfbIp4FIb
	1VvcaoKOUw0BP8fobzcM/xoYnm+tgQCdX0shs8tIdIk63ILhx2dgr85ta17gmeZyfRJo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hhspd-00083E-Ne
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jul 2019 09:42:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@google.com>) id 1hhFCt-0005Ou-WB
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 Jun 2019 15:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rb4ujqVAw96PiZ4Kdy6zh7jQWdxFSvYHFgTi6dHok/s=; b=PblzMBrHDKsRjh+W9yxp4TgG99
 W+RhowIuTdKn4Ti3HxFT/7aTsOSPskZ07XH9CCUz9KEvadcsQpmApLJ84cStB8NtJPso5ffw1ppjY
 WLKclHsCGM0iSS87yj2koUrONnD4by0D/IoQJ4KE8m6yivna+W90C4h/kYifeUjAxnag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rb4ujqVAw96PiZ4Kdy6zh7jQWdxFSvYHFgTi6dHok/s=; b=eu0L+FXERi6XksUVRtHfz+60HP
 9LwYwjmyMc06OUb1Nud5Hg8fWDwsnAB/gB4BDs5mAsnJW6/zuDEEyByyhagzkOSc410iyikr/lBYj
 HDPchq7KysajvBxY58+eL/0cQrDLYCY755CPKr/7RrLxyuWE/sy687mQlr6Nf9SqTJFA=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hhFCz-001mLh-Ol
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 Jun 2019 15:24:11 +0000
Received: by mail-io1-f68.google.com with SMTP id k20so18918358ios.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 29 Jun 2019 08:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rb4ujqVAw96PiZ4Kdy6zh7jQWdxFSvYHFgTi6dHok/s=;
 b=i4t8aFK2vW2co/byHHflzkSvGmfGkRVo2MznhCYrrTiI6vhL48z1S0R7/215Volb50
 HCqLFUlSTBHGyPfNyv1inHodw2zUnSTyC1QeqoJ1RnKS2mA9fSBLGF7Rf+NmzFdRLoTu
 UneguH4XWSYt9d2ilVWzydfoFqgAMzuR49QPMlD4U8l63JGEYDz1FbqRCYz9U7DGb0Om
 e2T16Z261WJSH6dwK8XieYyEq3U4VSNHnFTcNzrNpUhEllXmoAg9RY06uPKr+cIY4Fys
 Lgzhc5uSjP3BA36AbbnnIcu9V1/XuvjxBcQBMOBZGhY9QVNu8t27E87yZESch+v6m1HJ
 +LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rb4ujqVAw96PiZ4Kdy6zh7jQWdxFSvYHFgTi6dHok/s=;
 b=Xv0MrHk9kwkTlLNIi+dcwSptjTq+iZ8H1vmfqe4Fncls8GvfanFfFK7elCbg73Hltn
 KYIbebdshwRjuM3SrXOo4j50zPTNNj5nRdp0RcN7y3vAxdFicw/u28T9RuoQXA+1h0pe
 bmJA5vCa7XPPTQBnIXRFqHxiv9AICwgqsMcsfYon6/+2qPyZXlXl2V56rze2gJ7NqvhI
 zpcusX9HqtZmn6Ld01kI1gZM8LcsmjLvlZdWc3PnDA9aC2/kk+H5tseL0eE31yVQCdWT
 a0qh36RwsWDz4pbzkWZ26URtXAkVGfyFudAUkV4I3vyxixyS3Eb2t1nk3jVofubVhErM
 TKaA==
X-Gm-Message-State: APjAAAWP46wsKtkQ+2x9R5UA1Ak4j0OgKL2TJNXDo+NYuSWOGL1iRUJs
 fo4B2MO2yCwb30dUu9QbeLTFsltw3Gd/HcRWhnZuBw==
X-Google-Smtp-Source: APXvYqy/tqeBF4uzsVP2Ishjc5IYOD68hyWvXj/8JBhE1nVEw8GrcxpR4kAtGom/bRd9BFM9m4OmIeGm09zUJTndyO8=
X-Received: by 2002:a02:878a:: with SMTP id t10mr18035298jai.112.1561821843424; 
 Sat, 29 Jun 2019 08:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=W5oYiNRQEz4wg-8swR=sq6txWS28HryBkxhCkUXsnNjg@mail.gmail.com>
 <391f6bc3-71fb-0330-693d-841e4a15de9b@windriver.com>
In-Reply-To: <391f6bc3-71fb-0330-693d-841e4a15de9b@windriver.com>
Date: Sat, 29 Jun 2019 08:23:51 -0700
Message-ID: <CAD=FV=V4iKq-dTYDQgd6bqMpgehSVr=CfOfAs7Y+EdGzt8hwow@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hhFCz-001mLh-Ol
X-Mailman-Approved-At: Mon, 01 Jul 2019 09:42:40 +0000
Subject: Re: [Kgdb-bugreport] Entering kdb/kgdb at panic time before CPUs
 are killed?
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
From: Doug Anderson via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Doug Anderson <dianders@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Jun 28, 2019 at 8:17 PM Jason Wessel <jason.wessel@windriver.com> wrote:
>
> On 6/28/19 4:17 PM, Doug Anderson wrote:
> > I was trying to debug a crash using kdb / kgdb today and ran into a
> > problem I've seen before: being unable to get kdb / kgdb to debug one
> > of important tasks on the system.  Specifically I was unable to use
> > kdb to point to the CPU running the task and there was no shadow CPU
> > in kgdb.  Running "ps" in kdb showed:
> >
> > 0xecc9bd80      111        2  1    0   R  0xecc9c488  kworker/0:1H
> >    Error: no saved data for this cpu
> >
> > I decided to dig a little bit more this time and found that the
> > problem appears to be that "panic" stops all CPUs before calling the
> > panic notifier and then kdb / kgdb shows the CPU as dead.
> >
> > I wondered if anyone has given any thought to this problem before.
> > Obviously a "fix" is to add a special case for kdb / kgdb in the
> > panic() function before the CPUs die, but presumably that will be met
> > with resistance.  I'm curious if anyone else has good ideas.
> >
> >
> > -Doug
>
>
> You could set a breakpoint at panic(), instead of waiting for the notifier.

Yup, I've got that as a workaround.  I was wondering more about if
anyone had brilliant ideas about a solution that might be able to land
upstream.  I guess maybe the best bet is to just try sending up a
patch to add a special case to panic() and see what falls out.  ;-)

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
