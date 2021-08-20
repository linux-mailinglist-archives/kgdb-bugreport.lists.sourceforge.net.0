Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A23F3219
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 Aug 2021 19:15:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mH87Q-0003jU-Rs
	for lists+kgdb-bugreport@lfdr.de; Fri, 20 Aug 2021 17:15:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dianders@chromium.org>) id 1mH87P-0003jO-QJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 Aug 2021 17:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BatGZvnfPX/8BO8di0fHBk4PO/vONowvEXDrPfGjhtE=; b=Z3su9YXIxqVoqp9yVvgqfw7DXd
 PbutdlOK9xiv6Qnzag6lZ1Bf779ip6WLiz6mYkwBulDhozeJPDeADAu6V+0Ry3hXOZDeuJIaYo0HY
 fP0zZzEm9+pDW4BjXy6TCdVt0eVGWU76rT+BHApssIividrg6mK2Tx9lzS8wb0ulNxQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BatGZvnfPX/8BO8di0fHBk4PO/vONowvEXDrPfGjhtE=; b=i5jsyOOzUl28q9mctcHgfNEKSg
 qOjJmkX2bCbwlCl3oG3b0zyi6kN7q0acwc6GN2/D1mZs2H5scUb8pcXh1B0JsOuX+mj7SdBlSrR3X
 VioIG9tNrQrUmnLXRrAoQBHilfolaNJxqYFjElpvx6JK1F5RPckzcgHqRw85EDokPc2U=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mH87L-000212-IX
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 Aug 2021 17:15:47 +0000
Received: by mail-qt1-f174.google.com with SMTP id d5so8012585qtd.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 20 Aug 2021 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BatGZvnfPX/8BO8di0fHBk4PO/vONowvEXDrPfGjhtE=;
 b=QORcfENsVBzv8KOaanpTcj64PpMZIDbzZhbE3mr0pKZBKwLlkGP6mcMz/IL+aw+RTk
 QTCNYTNQwnLnlhZtj+50FDSPi79cQ5ZrCbvDKZIPmpeBW0yo9FMWxpZHAzS/2dqdWflI
 1f0Qa65z/MIWurpflq/kQ63w3GrHyiEUXFNo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BatGZvnfPX/8BO8di0fHBk4PO/vONowvEXDrPfGjhtE=;
 b=gr2uGWwPjuddU0AzkAPk+/pKt4K9Kq7ZOgdhyb/rposodtAI4DKh1SDbg5mmPxmRRD
 w+V8EteiwD14R4uyeCn9uoaXpzHUgBWGXJwer9u4r+44IS3TyDFPgmWaPkBM9JSpINQz
 y979vYWaoxQlFuj0OTl7IJDLWDjMtu8wryQFOOHtHyw1jRpXA5TwVtpp4NZ41iWlEquY
 L6B5608PdZrGk6C+vP9dVTwu1Ma03Zb1vIk7Yii1/XyiesYZ1WEzhFd2iIaiK0uZDNos
 rou8zrPW38+gmU0gA4Z5tdPyYnn4wLRe1x0yaotjgNudz6pz9r3lPCD+xbyo/JGPRdt3
 sG7w==
X-Gm-Message-State: AOAM530W5WXnCUgXei0l2jhkXdi9dAXUOl2tO78eBVnmlVz7KvW2VzpT
 O7LUCss4IMXtq4HkdAAt3L+2k8Xlh3NdzA==
X-Google-Smtp-Source: ABdhPJyas2aShATpW8sPCtbgMWiA40/kht47vnCLFuCHTK+Yl+8oYXsp8+ytwRvlygyqF9KRpquI1Q==
X-Received: by 2002:a05:6638:2712:: with SMTP id
 m18mr18365531jav.76.1629477979459; 
 Fri, 20 Aug 2021 09:46:19 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id f5sm3641832ils.3.2021.08.20.09.46.17
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:46:18 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id b200so13042805iof.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 20 Aug 2021 09:46:17 -0700 (PDT)
X-Received: by 2002:a6b:e70f:: with SMTP id b15mr1231462ioh.140.1629477977297; 
 Fri, 20 Aug 2021 09:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210820022442.11107-1-jing.yangyang@zte.com.cn>
In-Reply-To: <20210820022442.11107-1-jing.yangyang@zte.com.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Aug 2021 09:46:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJQQsK4-okC+6HSPQp8q_ahVYFHXDBhigSLGYLvnEJjQ@mail.gmail.com>
Message-ID: <CAD=FV=WJQQsK4-okC+6HSPQp8q_ahVYFHXDBhigSLGYLvnEJjQ@mail.gmail.com>
To: jing yangyang <cgel.zte@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mH87L-000212-IX
Subject: Re: [Kgdb-bugreport] [PATCH linux-next] debug:kdb: fix unsigned int
 win compared to less than zero
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 jing yangyang <jing.yangyang@zte.com.cn>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Zeal Robot <zealci@zte.com.cn>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Stephen Zhang <stephenzhangzsd@gmail.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Aug 19, 2021 at 7:25 PM jing yangyang <cgel.zte@gmail.com> wrote:
>
> Fix coccicheck warning:
> ./kernel/debug/kdb/kdb_support.c:575:3-10:
> WARNING:Unsigned expression compared with zero  p_state < 0
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> ---
>  kernel/debug/kdb/kdb_support.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index c605b17..fb30801 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -560,7 +560,7 @@ unsigned long kdb_task_state_string(const char *s)
>   */
>  char kdb_task_state_char (const struct task_struct *p)
>  {
> -       unsigned int p_state;
> +       int p_state;

This was talked about:

https://www.mail-archive.com/kgdb-bugreport@lists.sourceforge.net/msg06159.html

There, Peter Zijlstra said:

> Pre-existing fail that.. but yes that code (and it's carbon copy in
> arch/powerpc/xmon/xmon.c) are clearly bogus and have been for a long
> time afaict.
>
> Ideally someone that cares about this code can replace it with
> get_task_state() or something.

...so while the warning was introduced by commit 2f064a59a11f ("sched:
Change task_struct::state") and your fix papers over of the warning,
it actually doesn't fix the real bug. Apparently the comment
describing the "state" variable before that commit was wrong and "-1"
didn't mean unrunnable.

Maybe you could submit a v2 that does what Peter suggests?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
