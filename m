Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE905B836
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jul 2019 11:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:MIME-Version:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwV0Yecj1wG1Py2z+D2mVtQQVZsUO0Wccp91bhIdTZo=; b=A4U6A5K7ap55mpALIfYccfIGEb
	OfwV3mL8cjH6xBtQgD/W/5xjpt5MfC0ovXSCDFa2edLs1e99nyHnHKA0gWGj+ceKPd9JJvucDPOn8
	znXiGPv6VYw1I9lLwLuvbWNLdMD3i/eGENNrEgfiF5nWZQa+OHMWWdharqkwqx0kyvA4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hhspd-000835-LY
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jul 2019 09:42:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@google.com>) id 1hgyFA-00064y-D6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jun 2019 21:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Of1++IPBJWneZTcy2BsTfYiOffwIJQ5l+BD4GXnq76E=; b=YOMiiszQFO1rAA17PO8qiqwWV/
 8l99XhPHHBh/W4uC3PvoSoMvS5sS6LrvtWgGamhYrrwbTEuInS31ZHW5f+tO3bM4c68BwDc3YfU7E
 5PvUWjzc4XWNoF78ziD4AbiiQUftPVmsw6t/uoWGvNMJHdWfihtgaYab8CRJQ9MFK+Gs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Of1++IPBJWneZTcy2BsTfYiOffwIJQ5l+BD4GXnq76E=; b=k
 7nEuTzU0IPDgEaDSMx+tC87CwpoEIFEWUad5x0AIDNK0DT/DzSAH+qEl5nEIha8orz1H+7P1FZFTn
 qnXoDkhJ83S/KvzYuBF2I4R9MiyEGEXtzdTWH+cCtXoShKba3V2AQRDVk/UnRhAC2HAYYwQw29yxr
 ulIVwOgMXL9SoOZU=;
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hgyFK-0018R9-FQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jun 2019 21:17:27 +0000
Received: by mail-io1-f46.google.com with SMTP id j6so15455743ioa.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 Jun 2019 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Of1++IPBJWneZTcy2BsTfYiOffwIJQ5l+BD4GXnq76E=;
 b=DbASgw+aAO+EjEDc8VVf36JQ5h78Hx6HuctqOKI8JnBKq0lLWRhff0tCbcmO2Lr4K5
 8IxG8hWzulTDTY3zNCYizkhGz++TYhbn3Tgxc3tr+inLqBtHKw0A/tRyTrztmE2O8tsC
 67s2qJ8INiAv/BFPUiMczq25kWJdvd6teHdfsN9QoRIu0Jbdkewf/S/4sTV7uyTbyDV2
 Ntbn1N5pGvoAjJUZG9u8xtJUztyK2944nXt/OktYhDMZkhKRo3fBVYXcyyKCd1ASQ6dv
 /X2x8RgjKts2+gOpaXlNSyVPIkOpu1BaQqpWxTM3Wm6w0H4UxqBf4gYxMMJSAj0JtfsO
 A6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Of1++IPBJWneZTcy2BsTfYiOffwIJQ5l+BD4GXnq76E=;
 b=ofqlbuALpI/Hi8WbD/SUis+1UvrAC3u19sj24kZDp86fiMrC0RQgOBKKf95aLJtjfN
 m1k0nBRW630AwRyn1EbALsnIBbq7zbcQ0wJL66/xT9mRBMyOxTW6U194MG16IDAoGBJS
 MO230+71spf/QeATPkiY6AaZL/r+EAldLDswLjb5TACZSaI5bVnk5L9fVw0SbAqn88SA
 2WXOBmSjDMr8hzwAGr/FDEaH5ufiLeiQ1Ju88lzDhE9tBO8xFBSF/DEWtOCh0lLjc2zW
 XNqMl6SBun9FZZa36tQW26gJN0fiQBwyvu7vzBwwB0Dk24ZglCsSj2eWRr+Ptuymnb8n
 jMAw==
X-Gm-Message-State: APjAAAX9Y6MbK2BTZFmuaFGltNYREmYP/I6+GhtrSFskKKH1CFQhrmo5
 Dmh6PDGYh/gvgNQfhkHuLbklp8rgSZuXL6co0AcUmylyUWfLhg==
X-Google-Smtp-Source: APXvYqxYFCgB3VLWiHHk5Uk0c5XrukBOmpeFmERlngwzqcXHtMPY4leH2yMpGkVZYywO34fFkr6YsxTszh/BYd2fH0g=
X-Received: by 2002:a5d:885a:: with SMTP id t26mr3328511ios.218.1561756639970; 
 Fri, 28 Jun 2019 14:17:19 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 Jun 2019 14:17:08 -0700
Message-ID: <CAD=FV=W5oYiNRQEz4wg-8swR=sq6txWS28HryBkxhCkUXsnNjg@mail.gmail.com>
To: kgdb-bugreport@lists.sourceforge.net
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.46 listed in list.dnswl.org]
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
X-Headers-End: 1hgyFK-0018R9-FQ
X-Mailman-Approved-At: Mon, 01 Jul 2019 09:42:40 +0000
Subject: [Kgdb-bugreport] Entering kdb/kgdb at panic time before CPUs are
 killed?
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

I was trying to debug a crash using kdb / kgdb today and ran into a
problem I've seen before: being unable to get kdb / kgdb to debug one
of important tasks on the system.  Specifically I was unable to use
kdb to point to the CPU running the task and there was no shadow CPU
in kgdb.  Running "ps" in kdb showed:

0xecc9bd80      111        2  1    0   R  0xecc9c488  kworker/0:1H
  Error: no saved data for this cpu

I decided to dig a little bit more this time and found that the
problem appears to be that "panic" stops all CPUs before calling the
panic notifier and then kdb / kgdb shows the CPU as dead.

I wondered if anyone has given any thought to this problem before.
Obviously a "fix" is to add a special case for kdb / kgdb in the
panic() function before the CPUs die, but presumably that will be met
with resistance.  I'm curious if anyone else has good ideas.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
