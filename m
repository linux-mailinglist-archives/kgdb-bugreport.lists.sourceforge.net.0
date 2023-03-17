Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD86BF1C1
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Mar 2023 20:36:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pdFs0-0002bL-Lq
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Mar 2023 19:36:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1pdFrz-0002bF-2u
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Mar 2023 19:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vxWwhYtYMhTKLT+t03kqT9HvUsxnKyYicVxmtWlKd/U=; b=a4YBO90H8tFwG91BTM45FCC35S
 FEyiP01XN3DZJIfXqRscH74AwfRpw42OrU62UbZD8G+jTKkgphYSDSZ5RMYLArNVB+gYo4MHB4Sv5
 aA5FQfuqSs2f9kE0FKEMULRWAKVpPGY88GgI0sn+HEw4sbLOipAvZcfw3dVEJezdFvEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vxWwhYtYMhTKLT+t03kqT9HvUsxnKyYicVxmtWlKd/U=; b=K/gjmdWnzDPLKgOeNbdWJFr8gL
 254vzq7VG1s/OlvEX29OOKr2Nfp73iGeXsGUmVH2E4v40pEgFksRH4TUC6RkN+1tT5tQlfy9dYf9S
 j50mb0v2lqfcVsLyB3D7fQTcW7wuqz0MX42fZy4psqZvNr1H5NxM/HOZWBK6wcLIFfpw=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pdFrw-0004aG-4G for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Mar 2023 19:36:08 +0000
Received: by mail-ed1-f51.google.com with SMTP id r11so24480800edd.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Mar 2023 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679081757;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=vxWwhYtYMhTKLT+t03kqT9HvUsxnKyYicVxmtWlKd/U=;
 b=ShOImaYDHRTdZm639DxSfRFXK9aBTyc8alauCGHLRGH7KEtw+IblzEmmyIHxk0uzCC
 /4gsN39MR2FbpFrIZSTStT66QrnQt3khjpQOyqGF3XnKXtnPaPK1CzqAQlyAcQ/TgHOR
 tbMHFwoeeoh8SlmnBPf338CZjNJake86cABKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679081757;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxWwhYtYMhTKLT+t03kqT9HvUsxnKyYicVxmtWlKd/U=;
 b=SQD/eHfcxHAvlFxUSkyDntDrOLMvhjTjXWxo7VG+HtbnoDCJ6Qf3T+a5YxtYz572NH
 hV964wnx+Z4KMnWlYF7q5Gir8XXodSjt7kuPEnOo2zD205ng2GzKRyt/MA3ecSGU3aIZ
 veRHhgqujviBawfX8yQhBg23KyWmq+c8FcLUTC76n7Hfl2aY7+tQ3unXd4Xbp0/1ilui
 daPF6i9tN9McodwWe+VNryI4QjewUIE2kwJKcrCa9a04N6pWbc5S/2UtHw33lKdHrCat
 W0N+owQvp8XU5zbkOwJqVLkfWCt15ZNVU3ljYLcnDYRFrL6tj7NXwa0nyXrFMIYiQEjX
 Od9Q==
X-Gm-Message-State: AO0yUKX5B+gvViR/65gLO6KugxEiCiveq8i6+oMTxaanYk/O6S+EyJmr
 iZX59v6MovN6fD2+15cHoid4167IpKJdypg5ieP+pI80sKBDLxxM
X-Google-Smtp-Source: AK7set9HiEa6enkw+O8v0nH+vyluNOZUiaCR0NVYDozZkTby7pa60VguxOSXhQJyn+UdyYOLblrB7egT3k0I/PkyvWw=
X-Received: by 2002:a05:651c:48e:b0:295:95a8:c6a3 with SMTP id
 s14-20020a05651c048e00b0029595a8c6a3mr3635392ljc.10.1679079847107; Fri, 17
 Mar 2023 12:04:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Mar 2023 12:04:06 -0700
MIME-Version: 1.0
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Mar 2023 12:04:06 -0700
Message-ID: <CAE-0n50=j=GPQA=wQa5wE=P2T0ipOoOn6ekhPVAJhr5nMkiVnw@mail.gmail.com>
To: Chris Down <chris@chrisdown.name>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
 Jason Wessel <jason.wessel@windriver.com>, Jiri Kosina <jikos@kernel.org>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nick Terrell <terrelln@fb.com>, Petr Mladek <pmladek@suse.com>,
 Tom Rix <trix@redhat.com>, 
 bpf@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 live-patching@vger.kernel.org, llvm@lists.linux.dev
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Quoting Fabio M. De Francesco (2023-03-15 05:52:56) > Use
 kunmap_local() to unmap pages locally mapped with kmap_local_page(). > >
 kunmap_local()
 must be called on the kernel virtual address returned [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pdFrw-0004aG-4G
Subject: Re: [Kgdb-bugreport] [PATCH] module/decompress: Never use kunmap()
 for local un-mappings
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
Cc: Piotr Gorski <piotrgorski@cachyos.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Fabio M. De Francesco (2023-03-15 05:52:56)
> Use kunmap_local() to unmap pages locally mapped with kmap_local_page().
>
> kunmap_local() must be called on the kernel virtual address returned by
> kmap_local_page(), differently from how we use kunmap() which instead
> expects the mapped page as its argument.
>
> In module_zstd_decompress() we currently map with kmap_local_page() and
> unmap with kunmap(). This breaks the code and so it should be fixed.
>
> Cc: Piotr Gorski <piotrgorski@cachyos.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
