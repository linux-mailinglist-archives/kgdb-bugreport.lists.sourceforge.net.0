Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0378E735
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 09:32:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbc9o-0006qN-Ng
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 07:31:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wenst@chromium.org>) id 1qbc9n-0006qG-3u
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3uVsSpAW1DhF2x13GYmGZSVYciWwIfeitaqqWOip6FM=; b=Y5INHS67XARFzrGmiHGfUG5DtA
 DoEV9GolVzRf6+4qiMS0dExFmP4SU1pjtfa0FOjgJHasTsnDQUUS2dkFra5yf4gXKyOHHzQ7jSwQa
 dbkxoIby5ySoa1H9ZFZyXlWEoJ4eE39RYIMpwOxkweR5IuzIEHOjGxdlk5WoBM6brpfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3uVsSpAW1DhF2x13GYmGZSVYciWwIfeitaqqWOip6FM=; b=EPpVHhBLjivqHWl0y/np1gyF/z
 LGX1FAt4GPtlk2Fv/F+9s5F/6fAY4Hsq243bRqMpX5RFO6hEQsiglbOJCcSr9bDAkfTCdGEISrAv/
 PBX/V9AxGrpRStOn37htDfjjJd9HoKSDb5iZmyFLtJeLL1w3TUWwKHhipg6GXimTrmGA=;
Received: from mail-qv1-f43.google.com ([209.85.219.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbc9k-004U9q-2a for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:31:57 +0000
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-64b8e1c739aso3195026d6.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 31 Aug 2023 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693467110; x=1694071910;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uVsSpAW1DhF2x13GYmGZSVYciWwIfeitaqqWOip6FM=;
 b=b18eC6OR6lNxf/OXfAwdAbFkqIAXsRlkgQ0uLxCFS1KUkRDahkr4Kw+H72bZNSy8aC
 0g94KobfSeyxs5YpJGVzGHJpNZDdRmsTyucSj6CrMhfA/d99NOGT74V5P22ouuHpDo3b
 rVhDQ54cMW25ulGkuNW8nR873JSTCTDELeSS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693467110; x=1694071910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3uVsSpAW1DhF2x13GYmGZSVYciWwIfeitaqqWOip6FM=;
 b=f6A+W63UjrkzeeC7Lu49Zmk8/IKIdARxm5QRhxMl2dkrU/oXnTJIeDxaIUn51meVPY
 +3f6JaTZU4Od4rKF0ULfUGYyZS3U5vT8kjSeiC95kOhlGvYul9vuXypfUWa9tNWlJlwW
 z33kE9wASuM2WRwv7mDAvOpLgZp9RhigEa9fsgAtYlm0yx3kbfslmEGSsle3CGh4ujIF
 G8IUj4NubOm23J3OifonmeY1K2MpHvV8AmoTZIKI5mlY7zcKQ5PepFwWV9kpbCYdW3KM
 pngY0lDpETlnUggBE+MlQfP2XcaSZM9Pyitc8gp+5wCiTnWWH+VMuB/mXuND2Thk0a9M
 Oh/w==
X-Gm-Message-State: AOJu0YyMsZHRJHbU7kfv6KhXOVBn8z/Zw9gJ2vnpMj6xicG/QaV9B81/
 xxWe9DUdcIrmq23ShZvyGbD0JG4eBMnZsCthjfbfnjU2R9kXp8ztRhM=
X-Google-Smtp-Source: AGHT+IEGICoo3PYQAQ8/OyXlu3ek+xLE7aA2b5GZ2G0bfXSYq1N8geqPNGhehlKWNKIzgzA5dbtIER5HUdWf1vEen7A=
X-Received: by 2002:a67:fe16:0:b0:44e:9ab0:ed1d with SMTP id
 l22-20020a67fe16000000b0044e9ab0ed1dmr4534623vsr.1.1693465741445; Thu, 31 Aug
 2023 00:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230830191314.1618136-1-dianders@chromium.org>
In-Reply-To: <20230830191314.1618136-1-dianders@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Aug 2023 15:08:50 +0800
Message-ID: <CAGXv+5F4BLxj3Rum7ifaa51krRsd_yAcQUgPUpetf7doMbfRPw@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 31, 2023 at 3:14 AM Douglas Anderson <dianders@chromium.org>
    wrote: > > This is an attempt to resurrect Sumit's old patch series [1] that
    > allowed us to use the arm64 pseudo-NMI to get [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbc9k-004U9q-2a
Subject: Re: [Kgdb-bugreport] [PATCH v12 0/7] arm64: Add IPI for backtraces
 / kgdb; try to use NMI for some IPIs
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Stephane Eranian <eranian@google.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ingo Molnar <mingo@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Sami Tolvanen <samitolvanen@google.com>, kgdb-bugreport@lists.sourceforge.net,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Kees Cook <keescook@chromium.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMzoxNOKAr0FNIERvdWdsYXMgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIGFuIGF0dGVtcHQgdG8gcmVzdXJy
ZWN0IFN1bWl0J3Mgb2xkIHBhdGNoIHNlcmllcyBbMV0gdGhhdAo+IGFsbG93ZWQgdXMgdG8gdXNl
IHRoZSBhcm02NCBwc2V1ZG8tTk1JIHRvIGdldCBiYWNrdHJhY2VzIG9mIENQVXMgYW5kCj4gYWxz
byB0byByb3VuZCB1cCBDUFVzIGluIGtkYi9rZ2RiLiBUaGUgbGFzdCBwb3N0IGZyb20gU3VtaXQg
dGhhdCBJCj4gY291bGQgZmluZCB3YXMgdjcsIHNvIEkgc3RhcnRlZCBteSBzZXJpZXMgYXQgdjgu
IEkgaGF2ZW4ndCBjb3BpZWQgYWxsCj4gb2YgaGlzIG9sZCBjaGFuZ2Vsb25ncyBoZXJlLCBidXQg
eW91IGNhbiBmaW5kIHRoZW0gZnJvbSB0aGUgbGluay4KPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIHRh
cmdldHMgdjYuNi4gU3BlY2lmaWNhbGx5IGl0IGNhbid0IGxhbmQgaW4gdjYuNQo+IHNpbmNlIGl0
IGRlcGVuZHMgb24gY29tbWl0IDhkNTM5Yjg0ZjFlMyAoIm5taV9iYWNrdHJhY2U6IGFsbG93Cj4g
ZXhjbHVkaW5nIGFuIGFyYml0cmFyeSBDUFUiKS4KPgo+IEl0IHNob3VsZCBiZSBub3RlZCB0aGF0
IE1hcmsgc3RpbGwgZmVlbHMgdGhlcmUgbWlnaHQgYmUgc29tZSBjb3JuZXIKPiBjYXNlcyB3aGVy
ZSBwc2V1ZG8tTk1JIGlzIG5vdCBwcm9kdWN0aW9uIHJlYWR5IFsyXSBbM10sIGJ1dCBhcyBmYXIg
YXMKPiBJJ20gYXdhcmUgdGhlcmUgYXJlIG5vIGNvbmNyZXRlL2RvY3VtZW50ZWQgaXNzdWVzLiBS
ZWdhcmRsZXNzIG9mCj4gd2hldGhlciB0aGlzIHNob3VsZCBiZSBlbmFibGVkIGZvciBwcm9kdWN0
aW9uLCB0aG91Z2gsIHRoaXMgc2VyaWVzCj4gd2lsbCBiZSBpbnZhbHVhYmxlIHRvIGFueW9uZSB0
cnlpbmcgdG8gZGVidWcgY3Jhc2hlcyBvbiBhcm02NAo+IG1hY2hpbmVzLgo+Cj4gdjEyIG9mIHRo
aXMgc2VyaWVzIGNvbGxlY3RzIHRhZ3MsIGZpeGVzIGEgZmV3IHNtYWxsIG5pdHMgaW4gY29tbWVu
dHMKPiBhbmQgY29tbWl0IG1lc3NhZ2VzIGZyb20gdjExIGFuZCBhZGRzIGEgbmV3IChhbmQgc29t
ZXdoYXQgdW5yZWxhdGVkKQo+IHNtYWxsIHBhdGNoIHRvIHRoZSBlbmQgb2YgdGhlIHNlcmllcy4g
VGhlcmUgYXJlIG5vIGNvZGUgY2hhbmdlcyBvdGhlcgo+IHRoYW4gdGhlIGxhc3QgcGF0Y2gsIHdo
aWNoIGlzIHRpbnkuCj4KPiB2MTEgb2YgdGhpcyBzZXJpZXMgYWRkcmVzc2VkIFN0ZXBoZW4gQm95
ZCdzIGZlZWRiYWNrIG9uIHYxMCBhbmQgYWRkZWQKPiBhIG1pc3NpbmcgInN0YXRpYyIgdGhhdCB0
aGUgcGF0Y2hlcyByb2JvdCBmb3VuZC4KPgo+IHYxMCBvZiB0aGlzIHNlcmllcyBhdHRlbXB0ZWQg
dG8gYWRkcmVzcyBhbGwgb2YgTWFyaydzIGZlZWRiYWNrIG9uCj4gdjkuIEFzIGEgcXVpY2sgc3Vt
bWFyeToKPiAtIEl0IGluY2x1ZGVzIGhpcyBwYXRjaCB0byByZW1vdmUgSVBJX1dBS0VVUCwgZnJl
ZWluZyB1cCBhbiBleHRyYSBJUEkuCj4gLSBJdCBubyBsb25nZXIgY29tYmluZXMgdGhlICJrZ2Ri
IiBhbmQgImJhY2t0cmFjZSIgSVBJcy4gSWYgd2UgbmVlZAo+ICAgYW5vdGhlciBJUEkgdGhlc2Ug
Y291bGQgYWx3YXlzIGJlIHJlY29tYmluZWQgbGF0ZXIuCj4gLSBJdCBwcm9tb3RlcyBJUElfQ1BV
X1NUT1AgYW5kIElQSV9DUFVfQ1JBU0hfU1RPUCB0byBOTUkuCj4gLSBJdCBwdXRzIG5lYXJseSBh
bGwgdGhlIGNvZGUgZGlyZWN0bHkgaW4gc21wLmMuCj4gLSBTZXZlcmFsIG9mIHRoZSBwYXRjaGVz
IGFyZSBzcXVhc2hlZCB0b2dldGhlci4KPiAtIFBhdGNoICM2ICgia2dkYjogUHJvdmlkZSBhIHN0
dWIga2dkYl9ubWljYWxsYmFjaygpIGlmICFDT05GSUdfS0dEQiIpCj4gICB3YXMgZHJvcHBlZCBm
cm9tIHRoZSBzZXJpZXMgc2luY2UgaXQgbGFuZGVkLgo+Cj4gQmV0d2VlbiB2OCBhbmQgdjksIEkg
aGFkIGNsZWFuZWQgdXAgdGhpcyBwYXRjaCBzZXJpZXMgYnkgaW50ZWdyYXRpbmcKPiB0aGUgMTB0
aCBwYXRjaCBmcm9tIHY4IFs0XSBpbnRvIHRoZSB3aG9sZSBzZXJpZXMuIEFzIHBhcnQgb2YgdGhp
cywgSQo+IHJlbmFtZWQgdGhlICJOTUkgSVBJIiB0byB0aGUgImRlYnVnIElQSSIgc2luY2UgaXQg
Y291bGQgbm93IGJlIGJhY2tlZAo+IGJ5IGEgcmVndWxhciBJUEkgaW4gdGhlIGNhc2UgdGhhdCBw
c2V1ZG8gTk1JcyB3ZXJlbid0IGF2YWlsYWJsZS4gV2l0aAo+IHRoZSBmYWxsYmFjaywgdGhpcyBh
bGxvd2VkIG1lIHRvIGRyb3Agc29tZSBleHRyYSBwYXRjaGVzIGZyb20gdGhlCj4gc2VyaWVzLiBU
aGlzIGZlZWxzICh0byBtZSkgdG8gYmUgcHJldHR5IGNsZWFuIGFuZCBob3BlZnVsbHkgb3RoZXJz
Cj4gYWdyZWUuIEFueSBwYXRjaCBJIHRvdWNoZWQgc2lnbmlmaWNhbnRseSBJIHJlbW92ZWQgTWFz
YXlvc2hpIGFuZAo+IENoZW4tWXUncyB0YWdzIGZyb20uCj4KPiAuLi5hbHNvIGluIHY4LCBJIHJl
b3JkZXJkIHRoZSBwYXRjaGVzIGEgYml0IGluIGEgd2F5IHRoYXQgc2VlbWVkIGEKPiBsaXR0bGUg
Y2xlYW5lciB0byBtZS4KPgo+IFNpbmNlIHY3LCBJIGhhdmU6Cj4gKiBBZGRyZXNzZWQgdGhlIHNt
YWxsIGFtb3VudCBvZiBmZWVkYmFjayB0aGF0IHdhcyB0aGVyZSBmb3IgdjcuCj4gKiBSZWJhc2Vk
Lgo+ICogQWRkZWQgYSBuZXcgcGF0Y2ggdGhhdCBwcmV2ZW50cyB1cyBmcm9tIHNwYW1taW5nIHRo
ZSBsb2dzIHdpdGggaWRsZQo+ICAgdGFza3MuCj4gKiBBZGRlZCBhbiBleHRyYSBwYXRjaCB0byBn
cmFjZWZ1bGx5IGZhbGwgYmFjayB0byByZWd1bGFyIElQSXMgaWYKPiAgIHBzZXVkby1OTUlzIGFy
ZW4ndCB0aGVyZS4KPgo+IEl0IGNhbiBiZSBub3RlZCB0aGF0IHRoaXMgcGF0Y2ggc2VyaWVzIHdv
cmtzIHZlcnkgd2VsbCB3aXRoIHRoZSByZWNlbnQKPiAiaGFyZGxvY2t1cCIgcGF0Y2hlcyB0aGF0
IGhhdmUgbGFuZGVkIHRocm91Z2ggQW5kcmV3IE1vcnRvbidzIHRyZWUgYW5kCj4gYXJlIGN1cnJl
bnRseSBpbiBtYWlubGluZS4gSXQgd29ya3MgZXNwZWNpYWxseSB3ZWxsIHdpdGggdGhlICJidWRk
eSIKPiBsb2NrdXAgZGV0ZWN0b3IuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtYXJtLWtlcm5lbC8xNjA0MzE3NDg3LTE0NTQzLTEtZ2l0LXNlbmQtZW1haWwtc3VtaXQuZ2Fy
Z0BsaW5hcm8ub3JnLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1pGdkdxRCUy
RiUyRnBtJTJGbFpiK3BARlZGRjc3UzBRMDVOLmNhbWJyaWRnZS5hcm0uY29tLwo+IFszXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sL1pOREtWUDJtLWlpWkN6M3ZARlZGRjc3UzBRMDVOLmNh
bWJyaWRnZS5hcm0uY29tCj4gWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA0MTkx
NTUzNDEudjguMTAuSWMzNjU5OTk3ZDYyNDMxMzlkMDUyMmZjM2FmY2RmZDg4ZDdhNWYwMzBAY2hh
bmdlaWQvCj4KPiBDaGFuZ2VzIGluIHYxMjoKPiAtICgiYXJtNjQ6IHNtcDogTWFyayBJUEkgZ2xv
YmFscyBhcyBfX3JvX2FmdGVyX2luaXQiKSBuZXcgZm9yIHYxMi4KPiAtIEFkZGVkIGEgY29tbWVu
dCBhYm91dCB3aHkgd2UgYWNjb3VudCBmb3IgMTYgU0dJcyB3aGVuIExpbnV4IHVzZXMgOC4KPiAt
IE1pbm9yIGNvbW1lbnQgY2hhbmdlIHRvIGFkZCAiKCkiIGFmdGVyIG5taV90cmlnZ2VyX2NwdW1h
c2tfYmFja3RyYWNlLgo+IC0gVXBkYXRlZCB0aGUgY29tbWl0IGhhc2ggb2YgdGhlIGNvbW1pdCB0
aGlzIGRlcGVuZHMgb24uCj4KPiBDaGFuZ2VzIGluIHYxMToKPiAtIEFkanVzdCBjb21tZW50IGFi
b3V0IE5SX0lQSS9NQVhfSVBJLgo+IC0gRG9uJ3QgdXNlIGNvbmZ1c2luZyAiYmFja2VkIGJ5IiBp
ZGlvbSBpbiBjb21tZW50Lgo+IC0gTWFkZSBhcm02NF9iYWNrdHJhY2VfaXBpKCkgc3RhdGljLgo+
IC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZSBhcyBwZXIgU3RlcGhlbi4KPiAtIGFyY2hfc2VuZF93
YWtldXBfaXBpKCkgbm93IHRha2VzIGFuIHVuc2lnbmVkIGludC4KPgo+IENoYW5nZXMgaW4gdjEw
Ogo+IC0gKCJJUElfQ1BVX1NUT1AgYW5kIElQSV9DUFVfQ1JBU0hfU1RPUCBzaG91bGQgdHJ5IGZv
ciBOTUkiKSBuZXcgZm9yIHYxMC4KPiAtICgiYXJtNjQ6IHNtcDogUmVtb3ZlIGRlZGljYXRlZCB3
YWtldXAgSVBJIikgbmV3IGZvciB2MTAuCj4gLSBCYWNrdHJhY2Ugbm93IGRpcmVjdGx5IHN1cHBv
cnRlZCBpbiBzbXAuYwo+IC0gRG9uJ3QgYWxsb2NhdGUgdGhlIGNwdW1hc2sgb24gdGhlIHN0YWNr
OyBqdXN0IGl0ZXJhdGUuCj4gLSBNb3ZlZCBrZ2RiIGNhbGxzIHRvIHNtcC5jIHRvIGF2b2lkIG5l
ZWRpbmcgdG8gZXhwb3J0IElQSSBpbmZvLgo+IC0gUmV3cml0ZSBhcyBuZWVkZWQgZm9yIDUuMTEr
IGFzIHBlciBNYXJrIFJ1dGxhbmQgYW5kIFN1bWl0Lgo+IC0gU3F1YXNoIGJhY2t0cmFjZSBpbnRv
IHBhdGNoIGFkZGluZyBzdXBwb3J0IGZvciBwc2V1ZG8tTk1JIElQSXMuCj4gLSBrZ2RiIG5vdyBo
YXMgaXRzIG93biBJUEkuCj4KPiBDaGFuZ2VzIGluIHY5Ogo+IC0gQWRkZWQgY29tbWVudHMgdGhh
dCB3ZSBtaWdodCBub3QgYmUgdXNpbmcgTk1JIGFsd2F5cy4KPiAtIEFkZGVkIHRvIGNvbW1pdCBt
ZXNzYWdlIHRoYXQgdGhpcyBkb2Vzbid0IGNhdGNoIGFsbCBjYXNlcy4KPiAtIEZvbGQgaW4gdjgg
cGF0Y2ggIzEwICgiRmFsbGJhY2sgdG8gYSByZWd1bGFyIElQSSBpZiBOTUkgaXNuJ3QgZW5hYmxl
ZCIpCj4gLSBNb3ZlZCBoZWFkZXIgZmlsZSBvdXQgb2YgImluY2x1ZGUiIHNpbmNlIGl0IGRpZG4n
dCBuZWVkIHRvIGJlIHRoZXJlLgo+IC0gUmVtb3ZlIGFybTY0X3N1cHBvcnRzX25taSgpCj4gLSBS
ZW1vdmUgZmFsbGJhY2sgZm9yIHdoZW4gZGVidWcgSVBJIGlzbid0IGF2YWlsYWJsZS4KPiAtIFJl
bmFtZWQgIk5NSSBJUEkiIHRvICJkZWJ1ZyBJUEkiIHNpbmNlIGl0IG1pZ2h0IG5vdCBiZSBiYWNr
ZWQgYnkgTk1JLgo+IC0gYXJjaF90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNlKCkgbm8gbG9uZ2Vy
IHJldHVybnMgYm9vbAo+Cj4gQ2hhbmdlcyBpbiB2ODoKPiAtICJUYWcgdGhlIGFybTY0IGlkbGUg
ZnVuY3Rpb25zIGFzIF9fY3B1aWRsZSIgbmV3IGZvciB2OAo+IC0gUmVtb3ZlZCAiI2lmZGVmIENP
TkZJR19TTVAiIHNpbmNlIGFybTY0IGlzIGFsd2F5cyBTTVAKPiAtIGRlYnVnX2lwaV9zZXR1cCgp
IGFuZCBkZWJ1Z19pcGlfdGVhcmRvd24oKSBubyBsb25nZXIgdGFrZSBjcHUgcGFyYW0KPgo+IERv
dWdsYXMgQW5kZXJzb24gKDYpOgo+ICAgaXJxY2hpcC9naWMtdjM6IEVuYWJsZSBzdXBwb3J0IGZv
ciBTR0lzIHRvIGFjdCBhcyBOTUlzCj4gICBhcm02NDogaWRsZTogVGFnIHRoZSBhcm02NCBpZGxl
IGZ1bmN0aW9ucyBhcyBfX2NwdWlkbGUKPiAgIGFybTY0OiBzbXA6IEFkZCBhcmNoIHN1cHBvcnQg
Zm9yIGJhY2t0cmFjZSB1c2luZyBwc2V1ZG8tTk1JCj4gICBhcm02NDogc21wOiBJUElfQ1BVX1NU
T1AgYW5kIElQSV9DUFVfQ1JBU0hfU1RPUCBzaG91bGQgdHJ5IGZvciBOTUkKPiAgIGFybTY0OiBr
Z2RiOiBJbXBsZW1lbnQga2dkYl9yb3VuZHVwX2NwdXMoKSB0byBlbmFibGUgcHNldWRvLU5NSQo+
ICAgICByb3VuZHVwCj4gICBhcm02NDogc21wOiBNYXJrIElQSSBnbG9iYWxzIGFzIF9fcm9fYWZ0
ZXJfaW5pdAo+Cj4gTWFyayBSdXRsYW5kICgxKToKPiAgIGFybTY0OiBzbXA6IFJlbW92ZSBkZWRp
Y2F0ZWQgd2FrZXVwIElQSQoKV2hvbGUgc2VyaWVzIGlzCgpUZXN0ZWQtYnk6IENoZW4tWXUgVHNh
aSA8d2Vuc3RAY2hyb21pdW0ub3JnPgoKb24gU29saWRSdW4gaS5NWDhNTSBIdW1taW5nYm9hcmQg
UHVsc2UgYnkgaW5qZWN0aW5nIEhBUkRMT0NLVVAgd2l0aCBsa2R0bS4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5n
IGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
