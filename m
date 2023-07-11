Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53A74E288
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Jul 2023 02:25:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qJ1CU-0004Wp-5n
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 11 Jul 2023 00:25:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <senozhatsky@chromium.org>) id 1qJ1CS-0004Wj-Us
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 00:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=phtS90SFWoSB2M/4/0tBAboFQka70onYYgDuF8Bnzxc=; b=Sd8Pi8fhl0I346CDBGP1OJZHFg
 qHTFMfsAqcNsIO98wp/ALoua4Ci/fsFHNDYboUw86FN4m6le+ZTiTpDnc06kJtFCkUp4UXBygiVWp
 NvxwCw169HYHP6z7PonrFYCL4AwFu246AtXzLoSE0vhSLFbIZm53wpNkD2+1NHsenNY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=phtS90SFWoSB2M/4/0tBAboFQka70onYYgDuF8Bnzxc=; b=lG74VCIoGcKsBSPBEaBaiEJ7h5
 tP2xEEr9DudbN2TF5Mnc/x2/3RlgcDSW3zxTvlLsL6ZYiVZuuSSxhpTKc5GFaxu76mT4iJnCYAqJD
 qcLmO4BItwYBwnefAq5AXM91io6y0Lj7amddiyGVLkHdLFTZkqo1i7jCx0QAgOT0+5qw=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qJ1CR-0006pQ-8T for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 00:25:52 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-557790487feso3677755a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 10 Jul 2023 17:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689035143; x=1691627143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=phtS90SFWoSB2M/4/0tBAboFQka70onYYgDuF8Bnzxc=;
 b=H2lFKBB4nwZykWf0S6hXoh87mX9BBwJym1C/L2D29S/MCmY0+k5ss2gWud7lsrybyE
 92SMnd4c0fCXGYKHvgla6sUD2I02yhzxAQvmTYC1hdddf+f0Bd517tq8mWCf14elW2RR
 S+vgMUHkpRTtel8PwB6cQfvwWpK8+tkhTcn1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689035143; x=1691627143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phtS90SFWoSB2M/4/0tBAboFQka70onYYgDuF8Bnzxc=;
 b=Ajrfqvhz4OcqDWlxnVYNFnSZREjh74Fa9n/aMdS32cx+s31/LEBZbnuDJ1L7LMgq/m
 xYqoaYWDb2spIBge6X/uO8DSV47nvsOdz+0t73MiNZjfS1eaIQEiAIrdTeKtuG9FrBil
 I/mwoh7QhwGw7UxCeAX0xRMTxOxmoIRdhHyoFapheFryWn5NsoThyU0NuQeBnQoRhzFv
 WcsE7UYV/BdyeuP6//YasNHw3NXVOifudUZjp/q91md/sfiy0Nu/5BvFBm/bHC2pLUvN
 JMzhy54z2lu18AVQ6MZgBnzE56fCFqqsWvadUQA0gByAmn3DCMIhKr4eaH1KKfolpc/b
 Me8w==
X-Gm-Message-State: ABy/qLZrZVcPo0Mdfsikp/uzHp1tUuhXxG46aOLfhxjPCFwRW4JQZyw5
 3EhdM/QpD7L93qiPRlVchcSSBg==
X-Google-Smtp-Source: APBJJlGnxY+Ezvu3CVg1U9VOEkXTc8+APWIirtT10F0f2AlwlxWArmvh7pZuOsXVcyePjoA6TVrVuQ==
X-Received: by 2002:a17:903:48a:b0:1b8:72e2:9c4 with SMTP id
 jj10-20020a170903048a00b001b872e209c4mr13853651plb.60.1689035143415; 
 Mon, 10 Jul 2023 17:25:43 -0700 (PDT)
Received: from google.com ([110.11.159.72]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d90200b001b88af04175sm480789plz.41.2023.07.10.17.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 17:25:43 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:25:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20230711002536.GB12154@google.com>
References: <20230710134524.25232-1-john.ogness@linutronix.de>
 <20230710134524.25232-2-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710134524.25232-2-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On (23/07/10 15:51), John Ogness wrote: > It is allowed for
 consoles to provide no write() callback. For > example ttynull does this.
 > > Check if a write() callback is available before using it. > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FSL_HELO_FAKE          No description available.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJ1CR-0006pQ-8T
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 1/5] kdb: do not assume
 write() callback available
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (23/07/10 15:51), John Ogness wrote:
> It is allowed for consoles to provide no write() callback. For
> example ttynull does this.
> 
> Check if a write() callback is available before using it.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
