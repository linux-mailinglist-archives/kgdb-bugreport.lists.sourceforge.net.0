Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 340836FC7AE
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBr-0007bJ-0z
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulmf-0001Of-PM
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 03:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=clDf0mag7jSJOcBrV8uy3dVBVfVUaL1M4k8bgRC2I4s=; b=P/+NdxZ3taeVLzDmVaYSkLvHhw
 5q+7ktBK6dcwPc4KeMRuamwASbFw3bkAs7NLb4bfGk9l0uF5dVy4puFx0U0jCXOIXqXePL1NsjEeZ
 u01vFltfkyc9DG3PWEK8pG5+vhm+EE/I8uNBfUoC4Fsh0UA/bw+svfu6LDqEQ/9CE2lE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=clDf0mag7jSJOcBrV8uy3dVBVfVUaL1M4k8bgRC2I4s=; b=ZJnY00FT7BrMEHAP2AicxnH2OH
 oZDoMZFJVX1TH10VDY3C0MIRtkbw6lg3nmrtfxLmat/bUMi5HZjjWXisrDZIbLzMULw5zRuQ1U8+5
 IOU4KRwtrivOVz1yq/sN+/W2/p2Rs0pQ6Ol9HE8963gwxDwGFaJEa9pG3PSFbg65moKc=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulmg-00Erz8-29 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 03:07:02 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-643465067d1so1047743b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 20:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683256016; x=1685848016;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clDf0mag7jSJOcBrV8uy3dVBVfVUaL1M4k8bgRC2I4s=;
 b=ZgbOpyAhMkj8DW2/1MjEkpRHTBanrpSvOIXdvw2BbjHVmZ3yQvz/iIqqqBoF62VREp
 0KPDwGbr8UkfcN/CdmloQHP/wMuOlu8WKNZwWqeLgpyxaqRlsAs8yJS74nIG9A+MoQgW
 GiM4xHJ4mGmhdHZC/EMJNHdHGTLyv2rN2XTODv2WApYaZiJoFXZ/07rkA/ewdFm9ZXrK
 iqBaFLdxuZpZeOKyIY3Iv1JZRUDo6TdPC/mDg2HHKld1Jiyoa9GXwVjzVX2qUXZO2bkw
 N4dzuSlzQMFUVCknsGFbdRBLFBpdBeX3NTx4XpMRWbR7QEUT8nPGpfd5Ln1naff9xKgb
 Pa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683256016; x=1685848016;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=clDf0mag7jSJOcBrV8uy3dVBVfVUaL1M4k8bgRC2I4s=;
 b=UDjI2A/pyG59rzeYvwPyBoMmWKgpm5Wn9kBMZSd2oesm9XekDST20WlouGmG6BSB7j
 2qmKpV5tiOuAcMlF59egC97EWYeaXQmdW/rmWhm3caaVVHEDo1QcVA73CfnE6awgPYfL
 EsfoEHePqdhACADgbzyC9GHQGFF3QXaEpCvRUkQKuoYDweCUWldPLzDKDbsfiS3EpTok
 3/McoVK59oWlLGkYtLncozNf9SwK2SaVST/YHgVsfBh524+Ac0lIC49UabdbB2gVtPp+
 vfppZseP6kZ8MUGSZElfhoZr1hmOcCmltuVjbQJBwQ5mf91LrVW2viQstOSMCYqajYqF
 BzXw==
X-Gm-Message-State: AC+VfDwCfrTBQMKIN1kJnC94Pl+r3+IHN+xcW4PwChi8Bih6XI/KhMWs
 yR8j9HoCgkTURVdeDbovvUk=
X-Google-Smtp-Source: ACHHUZ46P1P4WoTqpa9RKU3PzJiT096JVizromiqphOqiUBMf2I/jgGp4hWYnFU/0f2fFZ7lH7p5+A==
X-Received: by 2002:a05:6a20:9d8e:b0:ef:bd:38 with SMTP id
 mu14-20020a056a209d8e00b000ef00bd0038mr4174463pzb.55.1683256016392; 
 Thu, 04 May 2023 20:06:56 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 b2-20020a170903228200b001aafa2e4716sm356432plh.264.2023.05.04.20.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 20:06:55 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 13:06:41 +1000
Message-Id: <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
In-Reply-To: <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > Do a search and replace of: > - NMI_WATCHDOG_ENABLED =>
 HARD_WATCHDOG_ENABLED
 > - watchdog_nmi_ => watchdog_hardlockup_ These are just making prefixes
 inconsistent again. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
X-Headers-End: 1pulmg-00Erz8-29
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 11/17] watchdog/hardlockup: Rename
 some "NMI watchdog" constants/function
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net,
 ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> Do a search and replace of:
> - NMI_WATCHDOG_ENABLED => HARD_WATCHDOG_ENABLED
> - watchdog_nmi_ => watchdog_hardlockup_

These are just making prefixes inconsistent again.

If you really want to do a prefix, I would call it hardlockup which
probably best matches existing code and sysctl / boot stuff, and
concentrate on non-static symbols.

No problem with minor things like this that touch arch/powerpc
going through Andrew's tree though. I'm sure sparc maintainers
wouldn't mind either.

Thanks,
Nick


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
